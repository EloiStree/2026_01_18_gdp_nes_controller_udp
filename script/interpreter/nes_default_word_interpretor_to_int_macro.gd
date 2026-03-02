class_name NesDefaultWordInterpretorToIntMacro
extends NesAbstractWordInterpretorToInt


# github.com/EloiStree/2024_08_29_ScratchToWarcraft

const RELEASE_OFFSET := 1000

# restart: 80> vie 800> ai 2000> right_ 1000> right- 10> jump:

@export var word_to_integer: Dictionary[String, int] = {
	"vie": 42,
	"ai": 2501,
	"join_game": 123456789,
	"leave_game": 987654321,
	"jump": 1038, # arrow up
	"sword": 1087, # z
	"shuriken": 1088, # x
	"left": 1037,
	"right": 1039,
	"restart": 1082,
}
@export var word_to_macro: Dictionary[String, String] = {
	"pess_a": "a+ 100> a-",
	"double_a": "a+ 100> a- 100> a+ 100> a-",
}



@export var end_char_to_word_for_press_and_release := ["=", ":" ,"⇵","↕","↕","↕","⇕","⬍"] 
@export var end_char_to_word_for_press := ["_", ".", "+","⌃","↑","⬆","↑"," ⇑"," ⬆"," ↥"," ⇧"]
@export var end_char_to_word_for_release := [ "-", "`", "-","⌄"," ⬇"," ⇓"," ↓"," ⬇"," ↓"," ↧","⇩" ]

@export var pression_time_in_milliseconds := 100

@export var use_print_to_debug := false

  

func add_integer_by_key_name(text: String, value: int) -> void:
	word_to_integer[text] = value

func clear_all_words() -> void:
	word_to_integer.clear()

func remove_integer_by_key_name(text: String) -> void:
	word_to_integer.erase(text)



# -------------------------------------------------------------------
# Dictionary Checks
# -------------------------------------------------------------------

func is_in_integer_dictionary(text: String) -> bool:
	return text in word_to_integer


func get_integer_by_key_name(text: String) -> int:
	return word_to_integer.get(text, 0)



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
	pass
	#if delay_ms > 0:
		#on_integer_to_send_requested_with_milliseconds_delay.emit(value, delay_ms)
	#else:
		#on_integer_to_send_requested.emit(value)


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
	


const press_char := "+"
const release_char := "-"
const press_and_release_char := "="

const MACRO_CHAR := "`"
const MAX_RECURSION := 20


func replace_macros(text: String) -> String:
	return _replace_macros_recursive(text, 0)


func _replace_macros_recursive(text: String, depth: int) -> String:
	if depth > MAX_RECURSION:
		push_error("Macro recursion limit reached.")
		return text

	var words: PackedStringArray = text.split(" ")
	var changed := false

	for i in words.size():
		var word := words[i]

		if word.ends_with(MACRO_CHAR):
			var base_word := word.left(word.length() - 1)

			if word_to_macro.has(base_word):
				words[i] = word_to_macro[base_word]
				changed = true

	var new_text := " ".join(words)

	if changed:
		return _replace_macros_recursive(new_text, depth + 1)

	return new_text

# -------------------------------------------------------------------
# Main Translation Logic
# -------------------------------------------------------------------

func _replace_by_integer_or_stay_the_same(word:String)->String:
	if word_to_integer.has(word):
		return str(word_to_integer[word])
	else :
		return word

func _to_override_parse_text_to_integer_macro(text:String)->String :
	
	text = _replace_macros_recursive(text, 0)

	if use_print_to_debug:
		print("Translating macro text: %s" % text)

	var string_builder:String=""
	var words := text.split(" ", false)


	if use_print_to_debug:
		print("Split into words: %s" %  ",".join(words))
		
	for w in words:
		string_builder+= " "
		if w.is_empty():
			continue
			
		if _is_valid_integer(w):
			string_builder+= w
			if use_print_to_debug:
				print("Found raw integer: %d" % int(w))
			continue
		if w.ends_with("s"):
			string_builder +=w 
			continue			
		if w.ends_with("ms"):
			string_builder +=w
			continue
		if w.ends_with(">"):
			string_builder +=w
			continue
		if w.begins_with("~"):
			string_builder +=w
			continue

		
		if w.find("|") != -1:
			var index_of_pipe = w.find("|")
			var left_part = w.substr(0, index_of_pipe)
			var right_part = w.substr(index_of_pipe + 1)
			if left_part.length() > 0:
				var left_char_end = left_part.substr(left_part.length() - 1)
				var c = left_char_end[0]
				if c == "+" or c == "-" or c == "=":
					var left_word = left_part.substr(0, left_part.length() - 1)
					left_word = _replace_by_integer_or_stay_the_same(left_word)
					string_builder += left_word + left_char_end + "|" + right_part
				else:
					left_part = _replace_by_integer_or_stay_the_same(left_part)
					string_builder += left_part + "|" + right_part
			
				# var left_char_end = w.substr(w.length() - 1)
				# var left_word = w.substr(0, w.length() - 1)
				# print("Found word with char at the end: %s (char: %s)" % [left_word, left_char_end])
				# left_word = _replace_by_integer_or_stay_the_same(left_word)
				# string_builder += left_word + left_char_end 
			continue
		

		if w.ends_with("+"):
			var word :String= w.substr(0, w.length()-1)
			word =_replace_by_integer_or_stay_the_same(word)
			string_builder +=word+"+"
			continue
		if w.ends_with("-"):
			var word :String= w.substr(0, w.length()-1)
			word =_replace_by_integer_or_stay_the_same(word)
			string_builder +=word+"-"
			continue

		if w.ends_with("="):
			var word :String= w.substr(0, w.length()-1)
			word =_replace_by_integer_or_stay_the_same(word)
			string_builder +=word+"="
			continue
				
		if word_to_integer.has(w):
			string_builder+= str(word_to_integer[w])
			continue
			

		if is_in_integer_dictionary(w):
			var value := get_integer_by_key_name(w)
			# on_integer_to_send_requested_with_milliseconds_delay.emit(value, relative_time_in_ms)
			if use_print_to_debug:
				print("Found named integer: %s (value: %d)" % [w, value])
			continue

	return string_builder

func clear_and_add_word_to_macro_from_text(text:String):
	word_to_macro.clear()
	add_word_to_macro_from_text(text)


func add_word_to_macro_from_text(text:String):
	var word_to_macro_spliter:String=":"
	text = text.replace("\r", " ")
	var lines = text.split("\n")
	for line in lines:
		var first_spliter_index = line.find(word_to_macro_spliter)
		if first_spliter_index == -1:
			continue
		var word = line.substr(0, first_spliter_index).strip_edges()
		var macro = line.substr(first_spliter_index + 1).strip_edges()
		if word.is_empty() or macro.is_empty():
			continue
		word_to_macro[word] = macro
		print ("Added word to macro: %s => %s" % [word, macro])
		
func clear_and_add_word_to_int_from_text(text:String):
	word_to_integer.clear()
	add_word_to_int_from_text(text)
			
func add_word_to_int_from_text(text:String ):
	var word_to_int_spliter:String=":"
	# Keep only one space of separation 
	text = text.replace("\t", " ")
	text = text.replace("\r", " ")
	text = text.replace("\n", " ")
	while text.find("  ") != -1:
		text = text.replace("  ", " ")
	# replace " : " by ":"
	text = text.replace(" " + word_to_int_spliter , word_to_int_spliter)
	text = text.replace( word_to_int_spliter + " ", word_to_int_spliter)
	print ("Adding word to int from text: %s" % text)

	var words = text.split(" ")
	for w in words:
		w = w.strip_edges()
		if w.is_empty():
			continue
		if w.find(word_to_int_spliter) != -1:
			var pair = w.split(word_to_int_spliter)
			if pair.size() == 2 and _is_valid_integer(pair[1]):
				var word = pair[0].strip_edges()
				var value = int(pair[1])
				word_to_integer[word] = value
				print("Added word to int: %s => %d" % [word, value])
		
	
func add_word_to_integer_macro(key:String, value:int):
		word_to_integer[key] = value
		
func add_word_to_text_macro(key:String, value:String):
		word_to_macro[key] = value
