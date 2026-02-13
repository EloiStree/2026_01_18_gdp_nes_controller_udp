extends Node
class_name NesParseIntegerToString 

signal on_integer_parsed(integer_as_text:String)

@export var label_to_affect:Array[Label]
@export var last_value_pushed:String

func push_in_integer_to_parse(integer_value:int):
	var str= str(integer_value)
	last_value_pushed= str
	
	on_integer_parsed.emit(str)
	for label in label_to_affect:
		if label!= null:			
			label.text= str
