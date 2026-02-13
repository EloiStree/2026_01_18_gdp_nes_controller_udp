# TouchFriendlyButton.gd
# Attach to Button or TextureButton

class_name ButtonWithFinger extends Button   # ← or extends TextureButton

@export var action_name: String = ""   # Optional: trigger an Input action

func _gui_input(event: InputEvent) -> void:
	if not event is InputEventScreenTouch:
		return  # ignore mouse / other events (or handle them separately if wanted)
	
	if event.pressed:
		# Finger down → simulate button press
		button_down.emit()           # visual feedback (button pressed look)
		if toggle_mode:
			toggled.emit(!button_pressed)
			button_pressed = !button_pressed
		else:
			# For normal buttons: we usually wait for release to trigger "pressed"
			pass
		
		accept_event()  # stop propagation (important for multi-touch)
	
	else:  # released
		# Finger up → trigger the action + visual release
		if is_hovered():   # only trigger if finger is still over the button (optional)
			button_up.emit()
			pressed.emit()           # ← this is what most people connect to!
			
			if action_name != "":
				Input.action_press(action_name)
				Input.action_release(action_name)  # instant press-release
			
			accept_event()
