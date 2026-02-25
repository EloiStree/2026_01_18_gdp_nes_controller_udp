
## Represent a game that is playable in a NES format with Xbox Input.
class_name NesableGameMappingXboxBasic
extends Resource

@export var arrow_up:XboxControllerToInt.XboxCommandBasic = XboxControllerToInt.XboxCommandBasic.ARROW_UP
@export var arrow_right:XboxControllerToInt.XboxCommandBasic= XboxControllerToInt.XboxCommandBasic.ARROW_RIGHT
@export var arrow_down:XboxControllerToInt.XboxCommandBasic= XboxControllerToInt.XboxCommandBasic.ARROW_DOWN
@export var arrow_left:XboxControllerToInt.XboxCommandBasic= XboxControllerToInt.XboxCommandBasic.ARROW_LEFT
@export var button_a:XboxControllerToInt.XboxCommandBasic= XboxControllerToInt.XboxCommandBasic.BUTTON_DOWN_A
@export var button_b:XboxControllerToInt.XboxCommandBasic= XboxControllerToInt.XboxCommandBasic.BUTTON_RIGHT_B
@export var menu_left:XboxControllerToInt.XboxCommandBasic= XboxControllerToInt.XboxCommandBasic.BUTTON_MENU_LEFT
@export var menu_right:XboxControllerToInt.XboxCommandBasic= XboxControllerToInt.XboxCommandBasic.BUTTON_MENU_RIGHT
