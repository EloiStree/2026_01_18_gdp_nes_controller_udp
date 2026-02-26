
class_name NesableGameMappingKeyboard
extends NesableGameMappingAbstractGet

@export var arrow_up:KeyboardControllerToInt.KeyboardCommandInt = KeyboardControllerToInt.KeyboardCommandInt.Up
@export var arrow_right:KeyboardControllerToInt.KeyboardCommandInt= KeyboardControllerToInt.KeyboardCommandInt.Right 
@export var arrow_down:KeyboardControllerToInt.KeyboardCommandInt= KeyboardControllerToInt.KeyboardCommandInt.Down
@export var arrow_left:KeyboardControllerToInt.KeyboardCommandInt= KeyboardControllerToInt.KeyboardCommandInt.Left
@export var button_a:KeyboardControllerToInt.KeyboardCommandInt= KeyboardControllerToInt.KeyboardCommandInt.Alpha1
@export var button_b:KeyboardControllerToInt.KeyboardCommandInt= KeyboardControllerToInt.KeyboardCommandInt.Alpha2
@export var menu_left:KeyboardControllerToInt.KeyboardCommandInt= KeyboardControllerToInt.KeyboardCommandInt.Alpha3
@export var menu_right:KeyboardControllerToInt.KeyboardCommandInt= KeyboardControllerToInt.KeyboardCommandInt.Alpha4

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
