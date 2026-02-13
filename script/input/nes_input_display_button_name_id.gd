class_name NesInputDisplayButtonNameId
extends Node

signal on_down_up_with_device_info(device_name: String, device_id: int, button_index: int, pressed: bool)
@export var use_print_debug: bool = true

func _input(event):
	if event is InputEventJoypadButton:
		var device_name := Input.get_joy_name(event.device)
		if use_print_debug:
			print("Device:", device_name,
				  " ID:", event.device,
				  " Button:", event.button_index,	
				  " Pressed:", event.pressed)
				
		on_down_up_with_device_info.emit(
			"",
			device_name,
			event.device,
			event.button_index,
			event.pressed
		)
