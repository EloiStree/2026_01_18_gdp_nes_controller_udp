class_name NesFloatAxisToBoolEvent
extends Node

signal on_enter_negative_value()
signal on_exit_negative_value()

signal on_enter_positive_value()
signal on_exit_positive_value()

signal on_enter_death_zone_value()
signal on_exit_death_zone_value()

signal on_positive_zone_changed(is_in_zone: bool)
signal on_death_zone_changed(is_in_zone: bool)
signal on_negative_zone_changed(is_in_zone: bool)

@export var death_zone: float = 0.3
@export_group("For Debugging")
@export var is_in_positive_zone: bool
@export var is_in_death_zone: bool
@export var is_in_negative_zone: bool

func push_in_float_value(value: float):
	
	# Check death zone first
	var new_death = abs(value) <= death_zone
	
	if new_death != is_in_death_zone:
		is_in_death_zone = new_death
		on_death_zone_changed.emit( is_in_death_zone)
		if is_in_death_zone:
			on_enter_death_zone_value.emit()
		else:
			on_exit_death_zone_value.emit()
	
	# Positive zone (only if NOT in death zone)
	var new_positive = value > 0 and not is_in_death_zone
	if new_positive != is_in_positive_zone:
		is_in_positive_zone = new_positive
		on_positive_zone_changed.emit(is_in_positive_zone)
		if is_in_positive_zone:
			on_enter_positive_value .emit()
		else:
			on_exit_positive_value.emit()
	
	# Negative zone (only if NOT in death zone)
	var new_negative = value < 0 and not is_in_death_zone
	if new_negative != is_in_negative_zone:
		is_in_negative_zone = new_negative
		on_negative_zone_changed.emit( is_in_negative_zone)
		if is_in_negative_zone:
			on_enter_negative_value .emit()
		else:
			on_exit_negative_value.emit()
