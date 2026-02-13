class_name NesInputDeviceButtonDownUp
extends Node

signal on_down_up(pressed: bool)
signal on_down_up_with_device_info(device_name: String, device_id: int, button_index: int, pressed: bool)

@export var target_device_name: Array[String] = []
@export var target_button_index: int = 0

@export_group("For Debugging")
@export var input_state: bool = false


func _input(event):
	if event is InputEventJoypadButton:
		var device_name := Input.get_joy_name(event.device)
		
				
		if target_device_name.size() > 0 and device_name not in target_device_name:
			return
		if event.button_index != target_button_index:
			return
			
		var previous = input_state
		input_state = event.pressed
		var changed:bool= previous!=input_state
		if not changed:
			return 
			
		on_down_up.emit( event.pressed)
		on_down_up_with_device_info.emit(
			"",
			device_name,
			event.device,
			event.button_index,
			event.pressed
		)
