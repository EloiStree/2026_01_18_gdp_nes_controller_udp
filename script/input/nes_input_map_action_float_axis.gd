class_name NesInputMapActionFloatAxis
extends Node

signal on_float_axis_value_changed(float_axis_changed: float)

@export var action_name_positive_01: String
@export var action_name_negative_01: String

@export_group("For Debugging")
@export var input_state: float = 0.0
@export var input_state_negative: float = 0.0
@export var input_state_positive: float = 0.0

@export var debug_has_action_map_at_ready: bool = false

func _ready():
	if debug_has_action_map_at_ready:
		var bool_has_negative := InputMap.has_action(action_name_negative_01)
		var bool_has_positive := InputMap.has_action(action_name_positive_01)
		debug_has_action_map_at_ready = bool_has_negative and bool_has_positive
		if not debug_has_action_map_at_ready:
			print("Warning: One or both action names do not exist in the Input Map at ready. Positive exists: ", bool_has_positive, ", Negative exists: ", bool_has_negative)
		

func _process(delta):
	if not debug_has_action_map_at_ready:
		return  # Skip processing if action map is not ready
	# Read positive axis value, default to 0 if action is empty
	if action_name_positive_01.is_empty():
		input_state_positive = 0.0
	else:
		input_state_positive = Input.get_action_strength(action_name_positive_01)
		input_state_positive = clamp(input_state_positive, 0.0, 1.0)  # safety clamp

	# Read negative axis value, default to 0 if action is empty
	if action_name_negative_01.is_empty():
		input_state_negative = 0.0
	else:
		input_state_negative = Input.get_action_strength(action_name_negative_01)
		input_state_negative = clamp(input_state_negative, 0.0, 1.0)  # safety clamp

	# Combine positive and negative to get final axis value (-1.0 .. 1.0)
	var new_value = input_state_positive - input_state_negative

	# Emit signal only if value changed
	if new_value != input_state:
		input_state = new_value
		on_float_axis_value_changed.emit(input_state)
