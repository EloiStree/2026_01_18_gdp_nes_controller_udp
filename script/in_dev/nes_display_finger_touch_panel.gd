class_name NesDisplayFingersTouchPanel
extends Node

@export var panel_to_move: Array[Control]

var active_touches := {}

func _input(event):

	if event is InputEventScreenTouch:
		if event.pressed:
			active_touches[event.index] = event.position
		else:
			active_touches.erase(event.index)

	elif event is InputEventScreenDrag:
		if event.index in active_touches:
			active_touches[event.index] = event.position


func _process(delta: float) -> void:

	var i := 0
	for touch_pos in active_touches.values():
		if i >= panel_to_move.size():
			break

		var panel := panel_to_move[i]

		# Center panel on finger
		panel.global_position = touch_pos - panel.size * 0.5

		i += 1
