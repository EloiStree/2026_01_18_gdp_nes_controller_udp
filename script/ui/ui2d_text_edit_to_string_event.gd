extends Node

signal on_text_submit(text:String)

@export var text_editor_target :TextEdit


func push_text_when_asked():
	on_text_submit.emit(text_editor_target.text)

func _ready() -> void:
	text_editor_target.text_set.connect(push_text_when_asked)
