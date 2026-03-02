class_name NesUiTextEditChangedRelay
extends Node

signal on_text_changed(text:String)

@export var to_listen:TextEdit
@export var push_at_ready:bool=true
@export var ready_push_delay_seconds:float=0.05

func _ready() -> void:
	to_listen.text_changed.connect(push_text)
	if push_at_ready:
		await get_tree().create_timer(ready_push_delay_seconds).timeout
		push_text()
		
	
func push_text():
	if to_listen:
		on_text_changed.emit(to_listen.text)
	
	
