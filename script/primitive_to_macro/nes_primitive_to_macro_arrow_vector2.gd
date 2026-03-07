class_name NesPrimitiveToMacroArrowVector2
extends NesAbstractMacroEmitter


signal on_value_updated(value:Vector2)

signal on_up_changed(new_value:bool)
signal on_right_changed(new_value:bool)
signal on_down_changed(new_value:bool)
signal on_left_changed(new_value:bool)
signal on_death_changed(new_value:bool)


@export var is_in_left_zone:bool=false
@export var is_in_right_zone:bool=false
@export var is_in_up_zone:bool=false
@export var is_in_down_zone:bool=false
@export var is_in_death_zone:bool=false



@export var vector2_value:Vector2
@export var death_zone_radius:float=0.3


@export_group("Local Settable Macro")
@export var up_enter_zone_macro_group:Array[String]
@export var up_exit_zone_macro_group:Array[String]

@export var right_enter_zone_macro_group:Array[String]
@export var right_exit_zone_macro_group:Array[String]

@export var down_enter_zone_macro_group:Array[String]
@export var down_exit_zone_macro_group:Array[String]

@export var left_enter_zone_macro_group:Array[String]
@export var left_exit_zone_macro_group:Array[String]


@export var death_enter_zone_macro_group:Array[String]
@export var death_exit_zone_macro_group:Array[String]

@export_group("Resource Ranged Macro")
@export var horizontal_axis_range_to_macro:Array[NesPrimitiveResourceRangeFloatToMacro]
@export var vertical_axis_range_to_macro:Array[NesPrimitiveResourceRangeFloatToMacro]


var resource_horizontal_in_range_dictionary:Dictionary[int,NesPrimitiveResourceRangeFloatToMacro]={}
var resource_horizontal_in_range_dictionary_value:Dictionary[int,bool]={}
var resource_vertical_in_range_dictionary:Dictionary[int,NesPrimitiveResourceRangeFloatToMacro]={}
var resource_vertical_in_range_dictionary_value:Dictionary[int,bool]={}


func _ready():
	for resource in horizontal_axis_range_to_macro:
		resource_horizontal_in_range_dictionary[resource.get_instance_id()] = resource
		resource_horizontal_in_range_dictionary_value[resource.get_instance_id()] = false
	for resource in vertical_axis_range_to_macro:
		resource_vertical_in_range_dictionary[resource.get_instance_id()] = resource
		resource_vertical_in_range_dictionary_value[resource.get_instance_id()] = false


func set_horizontal_axis_and_emit(new_value:float):
	set_vector2_value_and_emit(Vector2(new_value, vector2_value.y))

func set_vertical_axis_and_emit(new_value:float):
	set_vector2_value_and_emit(Vector2(vector2_value.x, new_value))

func set_vector2_value_and_emit(new_value:Vector2):
	vector2_value = new_value
	var previous_is_in_left_zone = is_in_left_zone
	var previous_is_in_right_zone = is_in_right_zone
	var previous_is_in_up_zone = is_in_up_zone
	var previous_is_in_down_zone = is_in_down_zone
	var previous_is_in_death_zone = is_in_death_zone
	
	is_in_death_zone = new_value.length() <= death_zone_radius
	is_in_left_zone = new_value.x < -death_zone_radius
	is_in_right_zone = new_value.x > death_zone_radius
	is_in_down_zone  = new_value.y < -death_zone_radius
	is_in_up_zone = new_value.y > death_zone_radius
	
	if previous_is_in_death_zone != is_in_death_zone:
		on_death_changed.emit(is_in_death_zone)
		if is_in_death_zone:
			notify_macro_array(death_enter_zone_macro_group)
		else:
			notify_macro_array(death_exit_zone_macro_group)
	if previous_is_in_up_zone != is_in_up_zone:
		on_up_changed.emit(is_in_up_zone)
		if is_in_up_zone:
			notify_macro_array(up_enter_zone_macro_group)
		else:
			notify_macro_array(up_exit_zone_macro_group)
	if previous_is_in_right_zone != is_in_right_zone:
		on_right_changed.emit(is_in_right_zone)
		if is_in_right_zone:
			notify_macro_array(right_enter_zone_macro_group)
		else:
			notify_macro_array(right_exit_zone_macro_group)
	if previous_is_in_down_zone != is_in_down_zone:
		on_down_changed.emit(is_in_down_zone)
		if is_in_down_zone:
			notify_macro_array(down_enter_zone_macro_group)
		else:
			notify_macro_array(down_exit_zone_macro_group)
	if previous_is_in_left_zone != is_in_left_zone:
		on_left_changed.emit(is_in_left_zone)
		if is_in_left_zone:
			notify_macro_array(left_enter_zone_macro_group)
		else:
			notify_macro_array(left_exit_zone_macro_group)


	for resource in horizontal_axis_range_to_macro:
		var in_range:bool = resource.is_in_range(new_value.x)
		var changed = resource_horizontal_in_range_dictionary_value.get(resource.get_instance_id(), false) != in_range
		resource_horizontal_in_range_dictionary_value[resource.get_instance_id()] = in_range
		if changed:
			if in_range:
				notify_macro_array(resource.macro_group_enter)
			else:
				notify_macro_array(resource.macro_group_exit)

	for resource in vertical_axis_range_to_macro:
		var in_range:bool = resource.is_in_range(new_value.y)
		var changed = resource_vertical_in_range_dictionary_value.get(resource.get_instance_id(), false) != in_range
		resource_vertical_in_range_dictionary_value[resource.get_instance_id()] = in_range
		if changed:
			if in_range:
				notify_macro_array(resource.macro_group_enter)
			else:
				notify_macro_array(resource.macro_group_exit)
		
	on_value_updated.emit(new_value)


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
