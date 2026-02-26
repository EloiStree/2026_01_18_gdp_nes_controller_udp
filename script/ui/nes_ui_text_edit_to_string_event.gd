class_name NesUiTextEditToStringEvent
extends Node

signal on_text_submit(text:String)

@export var text_editor_target :TextEdit
@export var emit_on_text_set:bool =true


func push_text_when_asked():
	on_text_submit.emit(text_editor_target.text)

func _ready() -> void:
	if emit_on_text_set:
		text_editor_target.text_set.connect(push_text_when_asked)
