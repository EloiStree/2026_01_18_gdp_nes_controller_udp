class_name NesMacroInterpreterToInt extends Node

signal on_integer_to_send_requested(integer_action: int)
signal on_integer_to_send_requested_with_milliseconds_delay(value_sent: int, milliseconds_delay: int)

# github.com/EloiStree/2024_08_29_ScratchToWarcraft

const RELEASE_OFFSET := 1000

# restart: 80> vie 800> ai 2000> right_ 1000> right- 10> jump:

@export var text_to_integer: Dictionary[String, int] = {
	"vie": 42,
	"ai": 2501,
	"join_game": 123456789,
	"leave_game": 987654321,
}

@export var text_to_press_release_integer: Dictionary[String, int] = {
	"jump": 1038, # arrow up
	"sword": 1087, # z
	"shuriken": 1088, # x
	"left": 1037,
	"right": 1039,
	"restart": 1082,
}

# Callables cannot be exported properly, keep runtime-only.
var text_to_callable: Dictionary[String, Callable] = {
	"hello_world": Callable(self, "_print_hello_world")
}

@export var pression_time_in_milliseconds := 100

@export var use_print_to_debug := false


func _print_hello_world():
	print("Hello world !")

# -------------------------------------------------------------------
# Callable Management
# -------------------------------------------------------------------

func add_callable_by_key_name(text: String, callable: Callable) -> void:
	text_to_callable[text] = callable

func remove_callable_by_key_name(text: String) -> void:
	text_to_callable.erase(text)

func is_in_callable_dictionary(text: String) -> bool:
	return text in text_to_callable


# -------------------------------------------------------------------
# Dictionary Checks
# -------------------------------------------------------------------

func is_in_integer_dictionary(text: String) -> bool:
	return text in text_to_integer

func is_in_press_release_integer_dictionary(text: String) -> bool:
	return text in text_to_press_release_integer

func get_integer_by_key_name(text: String) -> int:
	return text_to_integer.get(text, 0)

func get_press_release_integer_by_key_name(text: String) -> int:
	return text_to_press_release_integer.get(text, 0)

func get_callable_by_key_name(text: String) -> Callable:
	return text_to_callable.get(text, Callable())


# -------------------------------------------------------------------
# Parsing Helpers
# -------------------------------------------------------------------

func _is_valid_integer(text: String) -> bool:
	return text.is_valid_int()

func _try_parse_time_token(token: String) -> int:
	# Example: "150>"
	if not token.ends_with(">"):
		return -1

	var raw := token.left(-1)
	if raw.is_valid_int():
		return int(raw)
	return -1


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
			on_integer_to_send_requested.emit(int(w))
			if use_print_to_debug:
				print("Found raw integer: %d" % int(w))
			continue

		# --- Time Shift ---
		var time_shift := _try_parse_time_token(w)
		if time_shift >= 0:
			relative_time_in_ms += time_shift
			if use_print_to_debug:
				print("Found time shift: %d ms (new relative time: %d ms)" % [time_shift, relative_time_in_ms])
			continue

		# --- Press ---
		if w.ends_with("_"):
			var key := w.left(-1)
			if is_in_press_release_integer_dictionary(key):
				var value := get_press_release_integer_by_key_name(key)
				on_integer_to_send_requested_with_milliseconds_delay.emit(value, relative_time_in_ms)
				if use_print_to_debug:
					print("Found press: %s (value: %d)" % [key, value])
			continue

		# --- Release ---
		if w.ends_with("-"):
			var key := w.left(-1)
			if is_in_press_release_integer_dictionary(key):
				var value := get_press_release_integer_by_key_name(key) + RELEASE_OFFSET
				on_integer_to_send_requested_with_milliseconds_delay.emit(value, relative_time_in_ms)
				if use_print_to_debug:
					print("Found release: %s (value: %d)" % [key, value])
			continue

		# --- Press + Auto Release ---
		if w.ends_with(":"):
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

		push_warning("Unknown macro token: %s" % w)
