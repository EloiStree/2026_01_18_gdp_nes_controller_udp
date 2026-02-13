class_name NesInputMapActionDownUp
extends Node

signal on_down_up(pressed: bool)

@export var action_name: String

@export_group("For Debugging")
@export var input_state: bool = false


func _input(event):
	if action_name.is_empty():
		return
	if not event.is_action(action_name):
		return
	if event.is_pressed():
		input_state = true
		on_down_up.emit( true)
	else:
		input_state = false
		on_down_up.emit( false)
