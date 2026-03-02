class_name NesSaveLoadStringValueFromFileMemoryLineEdit
extends NesSaveLoadStringValueFromFileMemory


@export var to_affect:LineEdit


func _ready():
	if to_affect != null:
		to_affect.text_changed.connect(_save_text)
	on_value_loaded_from_file.connect(_set_affected)
	on_value_loaded_from_file.connect(_emit_text_changed)
	# call parent ready
	super()
	
func _emit_text_changed():
	to_affect.text_changed.emit()
	
func _save_text():
	save_given_text(to_affect.text)
	
func _set_affected(text:String):
	if to_affect != null:
		to_affect.text = text
