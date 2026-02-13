class_name NesInputMapActionFloatAxis
extends Node

signal on_float_axis_value_changed(float_axis_changed: float)

@export var action_name_positive_01: String
@export var action_name_negative_01: String

@export_group("For Debugging")
@export var input_state: float = 0.0
@export var input_state_negative: float = 0.0
@export var input_state_positive: float = 0.0


func _process(delta):
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
