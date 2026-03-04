class_name NesPrimitiveToMacroInt
extends Node
#
#signal on_value_updated()
#signal on_value_changed(new_value:bool)
#signal on_value_changed_to_true()
#signal on_value_changed_to_false()
#
#signal on_any_macro_emit(macro:String)
#
#@export var bool_value:bool
#
#@export var to_trigger_on_true:Array[String]
#
#@export var to_trigger_on_false:Array[String]
#
#func push_waiting_macro(macros: Array[String]):
	#for s in macros:
		#on_any_macro_emit.emit(s)
	#
#
#func set_boolean_value(new_value:bool):
	#var changed:bool = new_value == bool_value
	#on_value_updated.emit(new_value)
	#if changed:
		#on_value_changed.emit(new_value)
		#if new_value:
			#on_value_changed_to_true.emit()
			#push_waiting_macro(to_trigger_on_true)
		#else :
			#on_value_changed_to_false.emit()
			#push_waiting_macro(to_trigger_on_false)
			#
#func set_macro_on_boolean_true(macro:String):
	#to_trigger_on_true = [macro]
#
#func set_macro_on_boolean_true_array(macros:Array[String]):
	#to_trigger_on_true = macros
#
#func set_macro_on_boolean_false(macro:String):
	#to_trigger_on_false = [macro]
#
#func set_macro_on_boolean_true_false(macros:Array[String]):
	#to_trigger_on_false = macros
#
			#
#func set_boolean_to_true():
	#set_boolean_value(true)
	#
#func set_boolean_to_false():
	#set_boolean_value(false)
	#
