class_name NesAbstractMacroEmitter
extends Node

signal on_any_macro_emit(macro:String)

func notify_single_macro(macro:String):
	on_any_macro_emit.emit(macro)

func notify_macro_array(macros:Array[String]):
	for s in macros:
		on_any_macro_emit.emit(s)
