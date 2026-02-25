class_name NesTouchableButton
extends Button

var active_touches: Array[int] = []

func _gui_input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			active_touches.append(event.index)
			button_down.emit()
		else:
			active_touches.erase(event.index)
			button_up.emit()

			if active_touches.is_empty():
				pressed.emit()

		accept_event() # prevent default touch handling
