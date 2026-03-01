class_name NesUiAppendTextToTextEdit

extends Node

@export var text_edit:TextEdit
## 🎮🕹️ 🎹 ⌨️
@export var to_append:String = "🎮🕹️🎹⌨️"
@export var at_start:=false
@export var at_end:=true



func append_with_inspector_params():
	append_with_text(to_append)
	

func append_with_text(text:String):
	if at_start:
		text_edit.text = text+ text_edit.text
	if at_end:
		text_edit.text =  text_edit.text + text
