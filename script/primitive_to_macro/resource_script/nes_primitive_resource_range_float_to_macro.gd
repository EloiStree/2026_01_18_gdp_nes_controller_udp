class_name NesPrimitiveResourceRangeFloatToMacro
extends NesPrimitiveResourceMacroGroupEnterExit




@export var range_start_float:float=-1.0
@export var range_start_boundary:BoundaryType=BoundaryType.INCLUSIVE
@export var range_end_float:float=1.0
@export var range_end_boundary:BoundaryType=BoundaryType.INCLUSIVE
@export var inverse_of_range:bool=false

enum BoundaryType {
	INCLUSIVE,
	EXCLUSIVE
}

func is_in_range(value:float) -> bool:
	var start_condition:bool = value > range_start_float if range_start_boundary == BoundaryType.EXCLUSIVE else value >= range_start_float
	var end_condition:bool = value < range_end_float if range_end_boundary == BoundaryType.EXCLUSIVE else value <= range_end_float
	var in_range:bool = start_condition and end_condition
	return in_range if not inverse_of_range else not in_range
