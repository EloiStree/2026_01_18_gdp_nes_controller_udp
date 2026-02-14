class_name NesSwitchModeButtonB
extends Node


signal on_mode_changed_index(index:int)
signal on_mode_changed_label(label:String)

@export var nes_controller: NesControllerToInt
@export var button_index: int = 0

@export_group("Labels")
@export var label_x:="X"
@export var label_y:="Y"
@export var label_b:="B"
@export var label_side_button_left:="BL"
@export var label_side_button_right:="BR"
@export var label_trigger_left:="TL"
@export var label_trigger_right:="TR"



func _ready():
	set_mode_with_index(button_index)

func increment_mode_index():
	set_mode_with_index(button_index+1)

func set_mode_with_str_index(index:String):
	set_mode_with_index(int(index))
	
func set_mode_with_index(index: int):
	var previous :int= button_index;
	button_index = index % 7
	var changed :bool= previous != button_index
	if changed:
		match button_index:
			0:
				set_mode_as_button_b()
			1:
				set_mode_as_button_x()
			2:
				set_mode_as_button_y()
			3:
				set_mode_as_button_left_side()
			4:
				set_mode_as_button_right_side()
			5:
				set_mode_as_trigger_left_side()
			6:
				set_mode_as_trigger_right_side()
		on_mode_changed_index.emit(button_index)

func set_mode_as_button_b():
	nes_controller.override_button_b(1302)
	on_mode_changed_label.emit(label_b)

func set_mode_as_button_x():
	nes_controller.override_button_b(1301)
	on_mode_changed_label.emit(label_x)

func set_mode_as_button_y():
	nes_controller.override_button_b(1303)
	on_mode_changed_label.emit(label_y)

func set_mode_as_button_left_side():
	nes_controller.override_button_b(1304)
	on_mode_changed_label.emit(label_side_button_left)

func set_mode_as_button_right_side():
	nes_controller.override_button_b(1305)
	on_mode_changed_label.emit(label_side_button_right)

func set_mode_as_trigger_left_side():
	nes_controller.override_button_b(1358)
	on_mode_changed_label.emit(label_trigger_left)

func set_mode_as_trigger_right_side():
	nes_controller.override_button_b(1359)
	on_mode_changed_label.emit(label_trigger_right)


func _on_button_change_b_mode_pressed() -> void:
	pass # Replace with function body.


func _on_nes_save_load_string_value_from_file_memory_on_value_loaded_from_file(text: String) -> void:
	pass # Replace with function body.
