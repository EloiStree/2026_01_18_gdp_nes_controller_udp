class_name NesSwitchModeArrows
extends Node

signal on_mode_changed_index(index:int)
signal on_mode_changed_label(label:String)

@export var nes_controller: NesControllerToInt
@export var button_index: int = 0

@export_group("Labels")
@export var label_arrows_classic:="Arrows"
@export var label_arrows_left_joystick:="Left Joystick"
@export var label_arrows_right_joystick:="Right Joystick"
@export var label_arrows_vertical_left_horizontal_right:="Joystick Mixed"

func _ready():
	set_mode_with_index(button_index)

func increment_mode_index():
	set_mode_with_index(button_index+1)

func set_mode_with_index(index: int):
	var previous :int= button_index;
	button_index = index % 4
	var changed :bool= previous != button_index
	if changed:
		match button_index:
			0:
				set_mode_as_arrow_classic()
			1:
				set_mode_as_joystick_left()
			2:
				set_mode_as_joystick_right()
			3:
				set_mode_as_joystick_mixed_vertical_left_horizontal_right()

		on_mode_changed_index.emit(button_index)

func set_mode_as_arrow_classic():
	nes_controller.reset_arrows_to_default()
	on_mode_changed_label.emit(label_arrows_classic)

func set_mode_as_joystick_left():
	nes_controller.override_arrows_with_joystick_left()
	on_mode_changed_label.emit(label_arrows_left_joystick)

func set_mode_as_joystick_right():
	nes_controller.override_arrows_with_joystick_right()
	on_mode_changed_label.emit(label_arrows_right_joystick)

func set_mode_as_joystick_mixed_vertical_left_horizontal_right():
	nes_controller.override_arrows_with_stick_left_vertical_stick_right_horizontal()
	on_mode_changed_label.emit(label_arrows_vertical_left_horizontal_right)
