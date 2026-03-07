class_name NesPrimitiveToMacroInt
extends NesAbstractMacroEmitter

signal on_value_updated(value:int)
signal on_value_changed(new_value:int)
signal on_value_changed_with_previous(previous_value:int, new_value:int)


@export var integer_value:int
@export var exact_integer_to_macro:Array[NesPrimitiveResourceExactIntegerToMacro]
@export var range_integer_to_macro:Array[NesPrimitiveResourceRangeIntegerToMacro]


var resource_in_range_dictionary:Dictionary[int,NesPrimitiveResourceRangeIntegerToMacro]={}
var resource_in_range_dictionary_value:Dictionary[int,bool]={}



func set_integer_value_and_emit(new_value:int):
	var previous_value = integer_value
	integer_value = new_value
	var bool_value_changed:bool = previous_value != new_value


	if previous_value != new_value:
		on_value_changed.emit(new_value)
		on_value_changed_with_previous.emit(previous_value, new_value)
	on_value_updated.emit(new_value)


	if bool_value_changed:		
		for resource in exact_integer_to_macro:
			if resource.exact_integer == new_value:
				for macro in resource.macro_group_enter:
					on_any_macro_emit.emit(macro)
			if resource.exact_integer == previous_value:
				for macro in resource.macro_group_exit:
					on_any_macro_emit.emit(macro)


	for resource in range_integer_to_macro:
		var in_range:bool = resource.is_in_range(new_value)
		var previous_in_range:bool = resource_in_range_dictionary_value.get(resource.get_instance_id(), false)
		if in_range and not previous_in_range:
			for macro in resource.macro_group_enter:
				on_any_macro_emit.emit(macro)
		elif not in_range and previous_in_range:
			for macro in resource.macro_group_exit:
				on_any_macro_emit.emit(macro)
		resource_in_range_dictionary_value[resource.get_instance_id()] = in_range
 
