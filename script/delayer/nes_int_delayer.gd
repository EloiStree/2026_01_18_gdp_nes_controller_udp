extends Node
class_name NesIntDelayer

signal action_integer_requested(value: int)

var time_in_milliseconds: int = 0
var waiting_to_be_executed: Array[WhenToExecuteIntAction] = []

func _process(_delta: float) -> void:
	# Godot gives time in milliseconds directly. Progress.
	time_in_milliseconds = Time.get_ticks_msec()

	for i in range(waiting_to_be_executed.size() - 1, -1, -1):
		var item := waiting_to_be_executed[i]
		if item.when_to_execute_in_milliseconds < time_in_milliseconds:
			var to_execute := item.action_to_execute
			waiting_to_be_executed.remove_at(i)
			action_integer_requested.emit(to_execute)

func add_action_to_delay_as_integer_in_seconds(action_in_integer: int, seconds_delay: float) -> void:
	add_action_to_delay_as_integer_in_milliseconds(
		action_in_integer,
		int(seconds_delay * 1000.0)
	)

func add_action_to_delay_as_integer_in_milliseconds(action_in_integer: int, milliseconds_delay: int) -> void:
	waiting_to_be_executed.append(
		WhenToExecuteIntAction.new(
			action_in_integer,
			time_in_milliseconds + milliseconds_delay
		)
	)

class WhenToExecuteIntAction:
	var when_to_execute_in_milliseconds: int
	var action_to_execute: int

	func _init(action_in_integer: int, execute_at_milliseconds: int) -> void:
		action_to_execute = action_in_integer
		when_to_execute_in_milliseconds = execute_at_milliseconds
