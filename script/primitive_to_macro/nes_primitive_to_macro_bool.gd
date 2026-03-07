class_name NesPrimitiveToMacroBool
extends NesAbstractMacroEmitter

signal on_value_updated()
signal on_value_changed(new_value:bool)
signal on_value_changed_to_true()
signal on_value_changed_to_false()

@export var bool_value:bool

@export_group("Local Settable Macro")
@export var to_trigger_on_true:Array[String]
@export var to_trigger_on_false:Array[String]

@export_group("Resource Ranged Macro")
@export var to_trigger_resource:Array[NesPrimitiveResourceMacroGroupEnterExit]
@export var to_trigger_on_true_resource:Array[NesPrimitiveResourceMacroGroup]
@export var to_trigger_on_false_resource:Array[NesPrimitiveResourceMacroGroup]

func push_waiting_macro(macros: Array[String]):
	for s in macros:
		on_any_macro_emit.emit(s)
	
	
func set_boolean_value(new_value:bool):
	var changed:bool = new_value != bool_value
	bool_value = new_value
	on_value_updated.emit(new_value)
	if changed:
		on_value_changed.emit(new_value)
		if new_value:
			on_value_changed_to_true.emit()
			push_waiting_macro(to_trigger_on_true)
			for resource in to_trigger_on_true_resource:
				for macro in resource.macro_group:
					on_any_macro_emit.emit(macro)
			for resource in to_trigger_resource:
				for macro in resource.macro_group_enter:
					on_any_macro_emit.emit(macro)
		else :
			on_value_changed_to_false.emit()
			push_waiting_macro(to_trigger_on_false)
			for resource in to_trigger_on_false_resource:
				for macro in resource.macro_group:
					on_any_macro_emit.emit(macro)
			for resource in to_trigger_resource:
				for macro in resource.macro_group_exit:
					on_any_macro_emit.emit(macro)
			
func set_macro_on_boolean_true(macro:String):
	to_trigger_on_true = [macro]

func set_macro_on_boolean_true_array(macros:Array[String]):
	to_trigger_on_true = macros

func set_macro_on_boolean_false(macro:String):
	to_trigger_on_false = [macro]

func set_macro_on_boolean_true_false(macros:Array[String]):
	to_trigger_on_false = macros

			
func set_boolean_to_true():
	set_boolean_value(true)
	
func set_boolean_to_false():
	set_boolean_value(false)
	
