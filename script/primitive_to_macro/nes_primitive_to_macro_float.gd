class_name NesPrimitiveToMacroFloat
extends NesAbstractMacroEmitter




signal on_left_changed(new_value:bool)
signal on_right_changed(new_value:bool)
signal on_death_changed(new_value:bool)
@export var float_value:float
@export var death_zone_threshold:float=0.3


@export_group("Local Settable Macro")
@export var right_enter_zone_macro_group:Array[String]
@export var right_exit_zone_macro_group:Array[String]

@export var left_enter_zone_macro_group:Array[String]
@export var left_exit_zone_macro_group:Array[String]


@export var death_enter_zone_macro_group:Array[String]
@export var death_exit_zone_macro_group:Array[String]


@export_group("Resource Ranged Macro")
@export var range_float_to_macro:Array[NesPrimitiveResourceRangeFloatToMacro]


var resource_in_range_dictionary:Dictionary[int,NesPrimitiveResourceRangeFloatToMacro]={}
var resource_in_range_dictionary_value:Dictionary[int,bool]={}




@export_group("Debug")
@export var is_in_left_zone:bool=false
@export var is_in_right_zone:bool=false
@export var is_in_death_zone:bool=false


func _ready():
	for resource in range_float_to_macro:
		resource_in_range_dictionary[resource.get_instance_id()] = resource
		resource_in_range_dictionary_value[resource.get_instance_id()] = false

func set_float_value_and_emit(new_value:float):
	var previous_value = float_value
	float_value = new_value

	var absolute_value:float = abs(new_value)
	if absolute_value > death_zone_threshold and not is_in_death_zone:
		is_in_death_zone = true
		for macro in death_enter_zone_macro_group:
			on_any_macro_emit.emit(macro)
	elif absolute_value <= death_zone_threshold and is_in_death_zone:
		is_in_death_zone = false
		for macro in death_exit_zone_macro_group:
			on_any_macro_emit.emit(macro)

	if new_value > death_zone_threshold and not is_in_right_zone:
		is_in_right_zone = true
		for macro in right_enter_zone_macro_group:
			on_any_macro_emit.emit(macro)
	elif new_value <= death_zone_threshold and is_in_right_zone:
		is_in_right_zone = false
		for macro in right_exit_zone_macro_group:
			on_any_macro_emit.emit(macro)

	if new_value < -death_zone_threshold and not is_in_left_zone:
		is_in_left_zone = true
		for macro in left_enter_zone_macro_group:
			on_any_macro_emit.emit(macro)
	elif new_value >= -death_zone_threshold and is_in_left_zone:
		is_in_left_zone = false
		for macro in left_exit_zone_macro_group:
			on_any_macro_emit.emit(macro)



	for resource in range_float_to_macro:
		var in_range:bool = resource.is_in_range(new_value)
		var previous_in_range:bool = resource_in_range_dictionary_value[resource.get_instance_id()]
		if in_range and not previous_in_range:
			for macro in resource.macro_group_enter:
				on_any_macro_emit.emit(macro)
		elif not in_range and previous_in_range:
			for macro in resource.macro_group_exit:
				on_any_macro_emit.emit(macro)
		resource_in_range_dictionary_value[resource.get_instance_id()] = in_range

	
	

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
