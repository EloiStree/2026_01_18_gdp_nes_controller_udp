class_name NesUiTextToIntegerMacroTextEditor
extends Node


@export var from_text_editor:TextEdit
@export var to_text_editor:TextEdit
@export var to_abstract_int_in_text_editor:TextEdit
@export var macro_interpretor: NesAbstractWordInterpretorToInt
@export var int_interpretor: NesIntMacroInterpreterToInt

func _ready() -> void:
	from_text_editor.text_changed.connect(_parse_on_text_edit)


func _parse_on_text_edit():
	var text = macro_interpretor.parse_text_to_integer_macro(from_text_editor.text)
	if to_text_editor:
		to_text_editor.text= text
	
	if to_abstract_int_in_text_editor:
		var final_text = int_interpretor.translate_text_to_debug_final_integer_text(text)
		to_abstract_int_in_text_editor.text = final_text

	
