class_name GlobalTouchManager extends Control   # ← very important!
#
#var active_fingers: Dictionary = {}  # int (finger index) → Control
#
#func _input(event: InputEvent) -> void:
	#if not event is InputEventScreenTouch:
		#return
	#
	#var finger: int = event.index
	#
	#if event.pressed:
		#var viewport = get_viewport()
		#if viewport:
			## gui_pick() wants coordinates in viewport space (which event.position already is)
			#var picked = viewport.gui_pick(event.position)
			#
			#if picked and picked is Control:
				#active_fingers[finger] = picked
				#
				## Option A: If you want to simulate press on Controls that support it
				## (many built-in Controls like Button don't emit "pressed" via emit_signal)
				## → usually better to call their _gui_input() manually or use their built-in signals
				#
				## Option B (most common & clean): just track it and handle logic yourself
				#print("Finger ", finger, " pressed on ", picked.name)
				#
				## Example: if it's a custom button-like control with your own signal
				## if picked.has_signal("button_down"):
				##     picked.emit_signal("button_down")
	#
	#else:  # released
		#if active_fingers.has(finger):
			#var control: Control = active_fingers[finger]
			#active_fingers.erase(finger)
			#
			#if is_instance_valid(control):
				#print("Finger ", finger, " released from ", control.name)
				#
				## Handle release logic here
				## control.emit_signal("button_up")  # if you defined such signal
				#
				## Most reliable for custom press/release behavior:
				## → add your own signals (pressed, released, clicked) to custom controls
				## → or just do your logic directly here
