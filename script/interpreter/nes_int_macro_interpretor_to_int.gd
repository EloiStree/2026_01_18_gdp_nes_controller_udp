class_name NesIntMacroInterpreterToInt extends Node

signal on_integer_to_send_requested(integer_action: int)
signal on_integer_to_send_requested_with_milliseconds_delay(value_sent: int, milliseconds_delay: int)

# github.com/EloiStree/2024_08_29_ScratchToWarcraft
const RELEASE_OFFSET := 1000

@export var pression_time_in_milliseconds := 100
@export var use_print_to_debug := false


func _is_valid_integer(text: String) -> bool:
	return text.is_valid_int()

func is_text_end_by_char_in_array(text: String, char_array: Array) -> bool:
	for c in char_array:
		if text.ends_with(c):
			return true
	return false

func is_text_end_by_char_in_array_double(text: String, char_array: Array) -> bool:
	for c in char_array:
		var double_c :String= c + c
		if text.ends_with(double_c):
			return true
	return false


func _try_parse_time_token(token: String) -> int:
	# Example: "150>"
	if not token.ends_with(">"):
		return -1

	var raw := token.left(-1)
	if raw.is_valid_int():
		return int(raw)
	return -1


func _emit_integer(value: int, delay_ms: int = 0) -> void:
	if delay_ms > 0:
		on_integer_to_send_requested_with_milliseconds_delay.emit(value, delay_ms)
	else:
		on_integer_to_send_requested.emit(value)


func is_a_float(text: String) -> bool:
	# does it have the same 45,44 and 45.44 problem of C# with language?
	return text.is_valid_float()


func _is_word_to_delay_of_milliseconds(text: String) -> int:
	text = text.strip_edges().to_lower()
	if text.ends_with("ms"):
		var raw := text.left(-2)
		if raw.is_valid_int():
			return int(raw)
		elif raw.is_valid_float():
			return int(float(raw))
	return 0

func _is_word_to_delay_of_seconds_return_in_milliseconds(text: String) -> int:
	text = text.strip_edges().to_lower()
	if text.ends_with("s"):
		var raw := text.left(-1)
		if raw.is_valid_int():
			return int(raw) * 1000
		elif raw.is_valid_float():
			return int(float(raw) * 1000)
	return 0
	

func add(ref_pack:PackedInt32Array,  player_index:int,value:int,relative_time_in_ms:int):
	ref_pack.append(player_index)
	ref_pack.append(value)
	ref_pack.append(relative_time_in_ms)


## In the format S2W with IID you can send something like
## 0 , 1300 , 50,
## 0 , 2300 , 1500,
## that wont be delay but interpreted on the target software/hardware.
## This methode instead of delaying integer turn the text to this array format.
func build_integer_remote_array_iid(player_index:int, text:String)->PackedInt32Array:

	var package := PackedInt32Array()
	if use_print_to_debug:
		print("Translating macro text: %s" % text)

	var relative_time_in_ms := 0
	var words := text.split(" ", false)

	if use_print_to_debug:
		print("Split into words: %s" %  ",".join(words))
		
	for w in words:
		if w.is_empty():
			continue
		# --- Raw Integer ---
		if _is_valid_integer(w):
			add(package, player_index, int(w), relative_time_in_ms)
			if use_print_to_debug:
				print("Found raw integer: %d" % int(w))
			continue

		# if finish by S and start by a valide integer or valide float
		var delay_in_ms :int= _is_word_to_delay_of_seconds_return_in_milliseconds(w)
		if delay_in_ms > 0:
			relative_time_in_ms += delay_in_ms
			if use_print_to_debug:
				print("Found delay in seconds: %d ms (new relative time: %d ms)" % [delay_in_ms, relative_time_in_ms])
			continue

		if w.begins_with("~"):
			var raw := w.substr(1)
			# ~50
			# ~50,1000
			if raw.find(",") != -1:
				var parts := raw.split(",", false)
				if parts.size() == 2:
					var base_value_str := parts[0]
					var random_range_str := parts[1]
					if base_value_str.is_valid_int() and random_range_str.is_valid_int():
						var base_value := int(base_value_str)
						var random_range := int(random_range_str)
						var final_value := base_value + randi() % (random_range + 1)
						relative_time_in_ms += final_value # Optionally add the random value to the delay
						if use_print_to_debug:
							print("Found random integer with range: ~%d,%d (final value: %d)" % [base_value, random_range, final_value])
						continue
			else:
				if raw.is_valid_int():
					var base_value :=0
					var final_value := base_value + randi() % (int(raw) + 1)
					relative_time_in_ms += final_value # Optionally add the random value to the delay
					if use_print_to_debug:
						print("Found random integer: ~%d (final value: %d)" % [base_value, final_value])
					continue
			continue

		# if finish by MS and start by a valide integer or valide float
		delay_in_ms = _is_word_to_delay_of_milliseconds(w)
		if delay_in_ms > 0:
			relative_time_in_ms += delay_in_ms
			if use_print_to_debug:
				print("Found delay in milliseconds: %d ms (new relative time: %d ms)" % [delay_in_ms, relative_time_in_ms])
			continue


		# --- Time Shift ---
		var time_shift := _try_parse_time_token(w)
		if time_shift >= 0:
			relative_time_in_ms += time_shift
			if use_print_to_debug:
				print("Found time shift: %d ms (new relative time: %d ms)" % [time_shift, relative_time_in_ms])
			continue		

		# --- Press ---
		if w.ends_with( "+"):
			var key := w.left(-1)
				
			if _is_valid_integer(key):
				var value := int(key)

				if value >=0 and value <1000 :
					value = value+1000
				if value >=2000 and value <=2999:
					value = value-1000

				add(package, player_index, value, relative_time_in_ms)
				if use_print_to_debug:
					print("Found press: %s (value: %d)" % [key, value])
			continue

		# --- Release ---
		if w.ends_with("-"):
			var key := w.left(-1)
			if _is_valid_integer(key):
				var value := int(key) + RELEASE_OFFSET
				if value >=0 and value <1000 :
					value = value+2000
				if value >=1000 and value <2000 :
					value = value+1000

				add(package, player_index, value, relative_time_in_ms)
				if use_print_to_debug:
					print("Found release: %s (value: %d)" % [key, value])
			continue

		# --- Press + Auto Release ---
		if w.ends_with("="):
			var key := w.left(-1)
			if _is_valid_integer(key):
				var value := int(key)
				if value >=0 and value <1000 :
					value = value+1000
				if value >=2000 and value <=2999:
					value = value-1000

				add(package, player_index, value, relative_time_in_ms)
				add(package, player_index, value + RELEASE_OFFSET, relative_time_in_ms + pression_time_in_milliseconds)
				if use_print_to_debug:
					print("Found press+auto-release: %s (value: %d, auto-release at %d ms)" % [key, value, relative_time_in_ms + pression_time_in_milliseconds])
			continue

	return package

	
# -------------------------------------------------------------------
# Main Translation Logic
# -------------------------------------------------------------------

func translate_text_to_integer_event(text: String) -> void:
	var to_send :PackedInt32Array= build_integer_remote_array_iid(0,text)
	# every 3 elements
	for i in range(0, to_send.size(), 3):
		var player = to_send[i]
		var value = to_send[i+1]
		var date = to_send[i+2]
		if date ==0:
			on_integer_to_send_requested.emit(value)
		else:
			on_integer_to_send_requested_with_milliseconds_delay.emit(value, date)


func translate_text_to_debug_final_integer_text(text: String) -> String:
	var to_send :PackedInt32Array= build_integer_remote_array_iid(0,text)
	var string_builder :String= ""
	# every 3 elements
	for i in range(0, to_send.size(), 3):
		var value = to_send[i+1]
		var date = to_send[i+2]
		string_builder += " "+str(value)+"|"+str(date)
	return string_builder
	
			
			
