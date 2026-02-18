class_name NesMacroInterpreterToInt extends Node

signal on_integer_to_send_requested(integer_action: int)
signal on_integer_to_send_requested_with_milliseconds_delay(value_sent: int, milliseconds_delay: int)


# github.com/EloiStree/2024_08_29_ScratchToWarcraft

const RELEASE_OFFSET := 1000

# restart: 80> vie 800> ai 2000> right_ 1000> right- 10> jump:

@export var word_to_integer: Dictionary[String, int] = {
	"vie": 42,
	"ai": 2501,
	"join_game": 123456789,
	"leave_game": 987654321,
}

@export var word_to_press_release_integer: Dictionary[String, int] = {
	"jump": 1038, # arrow up
	"sword": 1087, # z
	"shuriken": 1088, # x
	"left": 1037,
	"right": 1039,
	"restart": 1082,
}


# Callables cannot be exported properly, keep runtime-only.
var word_to_callable: Dictionary[String, Callable] = {
	"hello_world": Callable(self, "_print_hello_world")
}

@export var end_char_to_word_for_press_and_release := ["=", ":" ,"⇵","↕","↕","↕","⇕","⬍"] 
@export var end_char_to_word_for_press := ["_", ".", "+","⌃","↑","⬆","↑"," ⇑"," ⬆"," ↥"," ⇧"]
@export var end_char_to_word_for_release := [ "-", "`", "-","⌄"," ⬇"," ⇓"," ↓"," ⬇"," ↓"," ↧","⇩" ]

@export var pression_time_in_milliseconds := 100

@export var use_print_to_debug := false

  


func _print_hello_world():
	print("Hello world !")

# -------------------------------------------------------------------
# Callable Management
# -------------------------------------------------------------------

func add_callable_by_key_name(text: String, callable: Callable) -> void:
	word_to_callable[text] = callable



func add_integer_by_key_name(text: String, value: int) -> void:
	word_to_integer[text] = value


## Test
func add_press_release_integer_by_key_name(text: String, value: int) -> void:
	word_to_press_release_integer[text] = value


func clear_all_words() -> void:
	word_to_callable.clear()
	word_to_integer.clear()
	word_to_press_release_integer.clear()

func remove_callable_by_key_name(text: String) -> void:
	word_to_callable.erase(text)

func remove_integer_by_key_name(text: String) -> void:
	word_to_integer.erase(text)

func remove_press_release_integer_by_key_name(text: String) -> void:
	word_to_press_release_integer.erase(text)

func is_in_callable_dictionary(text: String) -> bool:
	return text in word_to_callable


# -------------------------------------------------------------------
# Dictionary Checks
# -------------------------------------------------------------------

func is_in_integer_dictionary(text: String) -> bool:
	return text in word_to_integer

func is_in_press_release_integer_dictionary(text: String) -> bool:
	return text in word_to_press_release_integer

func get_integer_by_key_name(text: String) -> int:
	return word_to_integer.get(text, 0)

func get_press_release_integer_by_key_name(text: String) -> int:
	return word_to_press_release_integer.get(text, 0)

func get_callable_by_key_name(text: String) -> Callable:
	return word_to_callable.get(text, Callable())



# -------------------------------------------------------------------
# Parsing Helpers
# -------------------------------------------------------------------

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
	


# -------------------------------------------------------------------
# Main Translation Logic
# -------------------------------------------------------------------

func translate_text_to_integer_and_callable(text: String) -> void:
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
			_emit_integer(int(w),relative_time_in_ms)
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

				# --- Named Integer ---
		if is_in_integer_dictionary(w):
			var value := get_integer_by_key_name(w)
			on_integer_to_send_requested_with_milliseconds_delay.emit(value, relative_time_in_ms)
			if use_print_to_debug:
				print("Found named integer: %s (value: %d)" % [w, value])
			continue

		# --- Callable ---
		if is_in_callable_dictionary(w):
			var callable := get_callable_by_key_name(w)
			if callable.is_valid():
				callable.call()
			if use_print_to_debug:
				print("Found callable: %s, called successfully." % w)
			continue



		# --- Double ---
		if is_text_end_by_char_in_array_double(w, end_char_to_word_for_press_and_release):
			var key := w.left(-2)
			if is_in_press_release_integer_dictionary(key):
				var value := get_press_release_integer_by_key_name(key)
				_emit_integer(value, relative_time_in_ms)
				_emit_integer(value+1000, relative_time_in_ms + pression_time_in_milliseconds)
				_emit_integer(value, relative_time_in_ms + pression_time_in_milliseconds*2)
				_emit_integer(value+1000, relative_time_in_ms + pression_time_in_milliseconds*3)

				if use_print_to_debug:
					print("Found double press+auto-release: %s (value: %d, auto-release at %d ms)" % [key, value, relative_time_in_ms + pression_time_in_milliseconds])
			continue

		# --- Press ---
		if is_text_end_by_char_in_array(w, end_char_to_word_for_press):
			var key := w.left(-1)
			if is_in_press_release_integer_dictionary(key):
				var value := get_press_release_integer_by_key_name(key)
				on_integer_to_send_requested_with_milliseconds_delay.emit(value, relative_time_in_ms)
				if use_print_to_debug:
					print("Found press: %s (value: %d)" % [key, value])
			continue

		# --- Release ---
		if is_text_end_by_char_in_array(w, end_char_to_word_for_release):
			var key := w.left(-1)
			if is_in_press_release_integer_dictionary(key):
				var value := get_press_release_integer_by_key_name(key) + RELEASE_OFFSET
				on_integer_to_send_requested_with_milliseconds_delay.emit(value, relative_time_in_ms)
				if use_print_to_debug:
					print("Found release: %s (value: %d)" % [key, value])
			continue

		# --- Press + Auto Release ---
		if is_text_end_by_char_in_array(w, end_char_to_word_for_press_and_release):
			var key := w.left(-1)
			if is_in_press_release_integer_dictionary(key):
				var value := get_press_release_integer_by_key_name(key)
				on_integer_to_send_requested_with_milliseconds_delay.emit(value, relative_time_in_ms)
				on_integer_to_send_requested_with_milliseconds_delay.emit(
					value + RELEASE_OFFSET,
					relative_time_in_ms + pression_time_in_milliseconds
				)
				if use_print_to_debug:
					print("Found press+auto-release: %s (value: %d, auto-release at %d ms)" % [key, value, relative_time_in_ms + pression_time_in_milliseconds])
			continue



		#push_warning("Unknown macro token: %s" % w)
