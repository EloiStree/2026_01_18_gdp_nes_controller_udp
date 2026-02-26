## Statis utility with the S2W key for keyboard and gamepad of some game I use in the workshop and are playable in a NES format.

class_name NesableGameMappingInt
extends NesableGameMappingAbstractGet

@export var arrow_up:int =1281
@export var arrow_right:int=1282
@export var arrow_down:int=1283
@export var arrow_left:int=1284
@export var button_a:int=1285
@export var button_b:int=1286
@export var menu_left:int=1287
@export var menu_right:int=1288



func get_button_arrow_up()->int:
	return arrow_up
func get_button_arrow_right()->int:
	return arrow_right
func get_button_arrow_down()->int:
	return arrow_down
func get_button_arrow_left()->int:
	return arrow_left
func get_button_a()->int:
	return button_a
func get_button_b()->int:
	return button_b
func get_button_menu_left()->int:
	return menu_left
func get_button_menu_right()->int:
	return menu_right
