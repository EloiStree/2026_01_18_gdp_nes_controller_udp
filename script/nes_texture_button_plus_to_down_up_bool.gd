class_name NesTextureButtonPlusToDownUpBool extends Button

signal on_down_up_value_changed(on_press:bool)

@export_group("For Debugging")
@export var debug_value_on_off:bool

func _ready() -> void:
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)
	
func _on_button_down():
	debug_value_on_off=true
	on_down_up_value_changed.emit(true)
func _on_button_up():
	debug_value_on_off=false
	on_down_up_value_changed.emit(false)
	
