class_name NesAbstractWordInterpretorToInt extends Node

signal on_text_received_to_be_parsed(text_to_parse:String)
signal on_text_parsed_as_integer_macro(integer_macro:String)

## You Receive a text you need to parse it in a integer macro format
## 1300 800> 2300 1000> 42  1300|6000 2300|7000
## 1300+ 800> 1300- 1000> 42  1300+|6000 1300-|7000  1301=|9000
## int+ means keep it between 1000 and 1900
## int- means keep it between 2000 and 2900
## int= means with inspector value press now and delay the release of n milliseconds
## 1000> add relative waiting time
## 1300|9000 push 1300 at absolute time in the macro of 9 secons
func _to_override_parse_text_to_integer_macro(text:String) -> String:
	push_error("Should be overrided with inheritance")
	return ""

func parse_text_to_integer_macro(text:String) -> String:
	on_text_parsed_as_integer_macro.emit(text)
	var result:String= _to_override_parse_text_to_integer_macro(text)
	if result==null:
		result=""
	on_text_parsed_as_integer_macro.emit(result)
	return result
	
