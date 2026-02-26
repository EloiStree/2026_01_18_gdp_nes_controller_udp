
## Represent a game that is playable in a NES format with Xbox Input.
class_name NesableGameMappingXboxBasic
extends NesableGameMappingAbstractGet

@export var arrow_up:XboxControllerToInt.XboxCommandBasic = XboxControllerToInt.XboxCommandBasic.ARROW_UP
@export var arrow_right:XboxControllerToInt.XboxCommandBasic= XboxControllerToInt.XboxCommandBasic.ARROW_RIGHT
@export var arrow_down:XboxControllerToInt.XboxCommandBasic= XboxControllerToInt.XboxCommandBasic.ARROW_DOWN
@export var arrow_left:XboxControllerToInt.XboxCommandBasic= XboxControllerToInt.XboxCommandBasic.ARROW_LEFT
@export var button_a:XboxControllerToInt.XboxCommandBasic= XboxControllerToInt.XboxCommandBasic.BUTTON_DOWN_A
@export var button_b:XboxControllerToInt.XboxCommandBasic= XboxControllerToInt.XboxCommandBasic.BUTTON_RIGHT_B
@export var menu_left:XboxControllerToInt.XboxCommandBasic= XboxControllerToInt.XboxCommandBasic.BUTTON_MENU_LEFT
@export var menu_right:XboxControllerToInt.XboxCommandBasic= XboxControllerToInt.XboxCommandBasic.BUTTON_MENU_RIGHT

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
