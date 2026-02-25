class_name NesLocalRemappingToFacade
extends Node

@export var nes_to_affect:FacadeNesToUdp 
@export var is_active: bool = true

func _ready():
	nes_to_affect.on_send_int_to_target.connect(push_in_integer)

func push_in_integer(value_integer:int):
	if not is_active:
		return
	if value_integer== NesControllerToInt.NesLocalRemappingButton.ARROW_UP:
		nes_to_affect.nes_basic_press_arrow_down()
	elif value_integer == NesControllerToInt.NesLocalRemappingButton.ARROW_UP+1000:	
		nes_to_affect.nes_basic_release_arrow_down()
	elif value_integer == NesControllerToInt.NesLocalRemappingButton.ARROW_RIGHT:
		nes_to_affect.nes_basic_press_arrow_right()
	elif value_integer == NesControllerToInt.NesLocalRemappingButton.ARROW_RIGHT+1000:
		nes_to_affect.nes_basic_release_arrow_right()
	elif value_integer == NesControllerToInt.NesLocalRemappingButton.ARROW_DOWN:
		nes_to_affect.nes_basic_press_arrow_up()
	elif value_integer == NesControllerToInt.NesLocalRemappingButton.ARROW_DOWN+1000:
		nes_to_affect.nes_basic_release_arrow_up()
	elif value_integer == NesControllerToInt.NesLocalRemappingButton.ARROW_LEFT:
		nes_to_affect.nes_basic_press_arrow_left()
	elif value_integer == NesControllerToInt.NesLocalRemappingButton.ARROW_LEFT+1000:
		nes_to_affect.nes_basic_release_arrow_left()
	elif value_integer == NesControllerToInt.NesLocalRemappingButton.BUTTON_A:
		nes_to_affect.nes_basic_press_a()
	elif value_integer == NesControllerToInt.NesLocalRemappingButton.BUTTON_A+1000:
		nes_to_affect.nes_basic_release_a()
	elif value_integer == NesControllerToInt.NesLocalRemappingButton.BUTTON_B	:
		nes_to_affect.nes_basic_press_b()
	elif value_integer == NesControllerToInt.NesLocalRemappingButton.BUTTON_B+1000:
		nes_to_affect.nes_basic_release_b()
	elif value_integer == NesControllerToInt.NesLocalRemappingButton.MENU_LEFT:
		nes_to_affect.nes_basic_press_menu_left()
	elif value_integer == NesControllerToInt.NesLocalRemappingButton.MENU_LEFT+1000:
		nes_to_affect.nes_basic_release_menu_left()
	elif value_integer == NesControllerToInt.NesLocalRemappingButton.MENU_RIGHT:
		nes_to_affect.nes_basic_press_menu_right()
	elif value_integer == NesControllerToInt.NesLocalRemappingButton.MENU_RIGHT+1000:
		nes_to_affect.nes_basic_release_menu_right()
	
