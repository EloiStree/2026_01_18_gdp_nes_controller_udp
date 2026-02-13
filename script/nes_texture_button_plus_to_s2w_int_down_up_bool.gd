
## Scratch to Warcraft S2W https://github.com/EloiStree/S2W
class_name NesTextureButtonPlusToS2wIntDownUpBool extends Button

signal on_down_up_value_changed(on_press:bool)
signal on_request_int_action(int_action:int)

@export var press_key_value :int=1000
@export_group("For Debugging")
@export var debug_value_on_off:bool
@export var debug_int_sent:int

func _ready() -> void:
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)
	
func _on_button_down():
	debug_value_on_off=true
	on_down_up_value_changed.emit(true)
	debug_int_sent =press_key_value
	on_request_int_action.emit(press_key_value)
func _on_button_up():
	debug_value_on_off=false
	on_down_up_value_changed.emit(false)
	debug_int_sent =press_key_value+1000
	on_request_int_action.emit(press_key_value+1000)
	
