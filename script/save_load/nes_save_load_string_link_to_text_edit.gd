class_name NesSaveLoadStringLinkToTextEdit
extends Node


@export var to_affect:TextEdit
@export var memory: NesSaveLoadStringValueFromFileMemory
@export var load_at_ready:bool=true
@export var listen_to_on_changed:bool=false
@export var listen_to_on_submit:bool=true

func _ready() -> void:
	if load_at_ready:
		load_save()
		
	if listen_to_on_changed:
		to_affect.text_changed.connect(save_text_from_control_node)
	if listen_to_on_submit:
		to_affect.text_set.connect(save_text_from_control_node)

func load_save():
	var text = memory.load_text()
	if to_affect:
		to_affect.text = text
		
func save_given_text(text:String):
	if memory:
		memory.save_given_text(text)
	
func save_text_from_control_node():
	if memory and to_affect:
		memory.save_given_text(to_affect.text)
