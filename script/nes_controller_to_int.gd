# class name It allows other script ot refert to it
class_name NesControllerToInt extends Node

## Defines the different types of button press interactions for NES controller input.
##
## This enum represents the various ways a button can be pressed and released,
## allowing fine control over input timing and behavior.
enum PressType {
	## Registers a button press without releasing it.
	PRESS,
	## Registers a button release.
	RELEASE,
	## Presses and releases a button instantly without any frame delay.
	PRESS_RELEASE_NO_DELAY,
	## Presses and releases a button with a short frame delay between the two actions.
	PRESS_SHORT_STROKE,
	## Double click with designer choose of delay between clicks and press duration.
	DOUBLE_CLICK,
	## Triple click with designer choose of delay between clicks and press duration.
	TRIPLE_CLICK,
	## Presses for a second the key
	PRESS_FOR_SECOND,
	## Presses for 10 seconds the key for testing
	PRESS_FOR_10_SECONDS
}


enum NesButton {
	ARROW_UP=1281,
	ARROW_RIGHT=1282,
	ARROW_DOWN=1283,
	ARROW_LEFT=1284,
	BUTTON_A=1285,
	BUTTON_B=1286,
	MENU_LEFT=1287,
	MENU_RIGHT=1288
}

enum NesLocalRemappingButton {
	ARROW_UP=1291,
	ARROW_RIGHT=1292,
	ARROW_DOWN=1293,
	ARROW_LEFT=1294,
	BUTTON_A=1295,
	BUTTON_B=1296,
	MENU_LEFT=1297,
	MENU_RIGHT=1298
}



@export_group("Input use in S2W NES")
@export var button_a:int = 1300
@export var button_b:int = 1302
@export var button_menu_left:int = 1309
@export var button_menu_right:int = 1308
@export var button_arrow_up:int = 1311
@export var button_arrow_right:int = 1313
@export var button_arrow_down:int = 1315
@export var button_arrow_left:int = 1317

@export var quick_stroke_milliseconds :int=50
@export var between_clicks_milliseconds:int = 200
@export var press_click_duration_milliseconds:int = 200

@export var use_print_debugging:bool

signal on_integer_to_send_requested(integer_action:int)
signal on_integer_to_send_requested_with_milliseconds_delay(value_sent:int, milliseconds_delay:int)

#region GENERIC METHODE
func send_integer(integer_to_send:int):
	if use_print_debugging:
		print("Send Integer: ", integer_to_send)
	on_integer_to_send_requested.emit(integer_to_send)
	
func send_integer_with_delay_milliseconds(integer_to_send:int, milliseconds_delay:int):
	if use_print_debugging:
		print("Send Integer MS: ", integer_to_send, " - ", milliseconds_delay)
	on_integer_to_send_requested_with_milliseconds_delay.emit(integer_to_send,milliseconds_delay)

func press_key(key_press_value:int):
	send_integer(key_press_value)

func release_key(key_press_value:int):
	send_integer(key_press_value + 1000)

func stroke_key_no_delay(key_press_value:int):
	press_key(key_press_value)
	release_key(key_press_value)
	

func stroke_key_short(key_press_value:int):
	press_key(key_press_value)
	release_key_in_milliseconds(key_press_value, quick_stroke_milliseconds)

func set_down_up_key(key_press_value:int, value_down_up:bool):
	if value_down_up:
		press_key(key_press_value)
	else:
		release_key(key_press_value)
		

func press_key_in_milliseconds(key_press_value:int, press_duration_milliseconds:int):
	send_integer_with_delay_milliseconds(key_press_value, press_duration_milliseconds)

func release_key_in_milliseconds(key_press_value:int, release_delay_milliseconds:int):
	send_integer_with_delay_milliseconds(key_press_value + 1000, release_delay_milliseconds)

func press_key_in_seconds(key_press_value:int, press_duration_seconds:float):
	press_key_in_milliseconds(key_press_value, int(press_duration_seconds * 1000.0))

func release_key_in_seconds(key_press_value:int, release_delay_seconds:float):
	release_key_in_milliseconds(key_press_value, int(release_delay_seconds * 1000.0))


func stroke_key_for_milliseconds(key_press_value:int, press_duration_milliseconds:int):
	press_key(key_press_value)
	release_key_in_milliseconds(key_press_value, press_duration_milliseconds)

func stroke_key_for_seconds(key_press_value:int, press_duration_seconds:float):
	stroke_key_for_milliseconds(key_press_value, int(press_duration_seconds * 1000.0))

func stroke_key_in_milliseconds(key_press_value:int, delay_milliseconds:int, press_duration_milliseconds:int):
	press_key_in_milliseconds(key_press_value, delay_milliseconds)
	release_key_in_milliseconds(key_press_value, delay_milliseconds + press_duration_milliseconds)

func stroke_key_in_seconds(key_press_value:int, delay_seconds:float, press_duration_seconds:float):
	stroke_key_in_milliseconds(key_press_value, int(delay_seconds * 1000.0), int(press_duration_seconds * 1000.0))

func several_click(key_press_value:int, number_of_clicks:int, delay_between_clicks_milliseconds:int, press_duration_milliseconds:int):
	var time_relative = 0
	for i in range(number_of_clicks):
		press_key_in_milliseconds(key_press_value, time_relative)
		time_relative += press_duration_milliseconds
		release_key_in_milliseconds(key_press_value, time_relative)
		time_relative += delay_between_clicks_milliseconds

func double_click(key_press_value:int, delay_between_clicks_milliseconds:int, press_duration_milliseconds:int):
	several_click(key_press_value, 2, delay_between_clicks_milliseconds, press_duration_milliseconds)

func triple_click(key_press_value:int, delay_between_clicks_milliseconds:int, press_duration_milliseconds:int):
	several_click(key_press_value, 3, delay_between_clicks_milliseconds, press_duration_milliseconds)	

#endregion


#region CALL FROM ENUM
## PressType NesButton

func get_key_value_from_enum(key_enum:NesButton) -> int:
	match key_enum:
		NesButton.BUTTON_A:
			return button_a
		NesButton.BUTTON_B:
			return button_b
		NesButton.MENU_LEFT:
			return button_menu_left
		NesButton.MENU_RIGHT:
			return button_menu_right
		NesButton.ARROW_UP:
			return button_arrow_up
		NesButton.ARROW_RIGHT:
			return button_arrow_right
		NesButton.ARROW_DOWN:
			return button_arrow_down
		NesButton.ARROW_LEFT:
			return button_arrow_left
		_:
			push_error("Invalid NesButton enum: " + str(key_enum))
			return -1

func press_key_with_enum_and_pression_type(key_enum:NesButton, press_type:PressType):
	var key_value = get_key_value_from_enum(key_enum)
	match press_type:
		PressType.PRESS:
			press_key(key_value)
		PressType.RELEASE:
			release_key(key_value)
		PressType.PRESS_RELEASE_NO_DELAY:
			stroke_key_no_delay(key_value)
		PressType.PRESS_SHORT_STROKE:
			stroke_key_short(key_value)
		PressType.DOUBLE_CLICK:
			double_click(key_value, between_clicks_milliseconds, press_click_duration_milliseconds)
		PressType.TRIPLE_CLICK:
			triple_click(key_value, between_clicks_milliseconds, press_click_duration_milliseconds)
		PressType.PRESS_FOR_SECOND:
			press_key_in_seconds(key_value, 1)
		PressType.PRESS_FOR_10_SECONDS:
			press_key_in_seconds(key_value, 10)
		_:
			push_error("Invalid PressType: " + str(press_type))

func press_key_with_enum(key_enum:NesButton):
	press_key_with_enum_and_pression_type(key_enum, PressType.PRESS)

func release_key_with_enum(key_enum:NesButton):
	press_key_with_enum_and_pression_type(key_enum, PressType.RELEASE)

func press_key_with_enum_in_milliseconds(key_enum:NesButton, delay_milliseconds:int):
	var key_value = get_key_value_from_enum(key_enum)
	press_key_in_milliseconds(key_value, delay_milliseconds)

func release_key_with_enum_in_milliseconds(key_enum:NesButton, delay_milliseconds:int):
	var key_value = get_key_value_from_enum(key_enum)
	release_key_in_milliseconds(key_value, delay_milliseconds)

func press_key_with_enum_in_seconds(key_enum:NesButton, delay_seconds:float):
	var key_value = get_key_value_from_enum(key_enum)
	press_key_in_seconds(key_value, delay_seconds)

func release_key_with_enum_in_seconds(key_enum:NesButton, delay_seconds:float):
	var key_value = get_key_value_from_enum(key_enum)
	release_key_in_seconds(key_value, delay_seconds)

func stroke_key_with_enum_for_milliseconds(key_enum:NesButton, press_duration_milliseconds:int):
	var key_value = get_key_value_from_enum(key_enum)
	stroke_key_for_milliseconds(key_value, press_duration_milliseconds)

func stroke_key_with_enum_for_seconds(key_enum:NesButton, press_duration_seconds:float):
	var key_value = get_key_value_from_enum(key_enum)
	stroke_key_for_seconds(key_value, press_duration_seconds)

func stroke_key_with_enum_in_milliseconds(key_enum:NesButton, delay_milliseconds:int, press_duration_milliseconds:int):
	var key_value = get_key_value_from_enum(key_enum)
	stroke_key_in_milliseconds(key_value, delay_milliseconds, press_duration_milliseconds)

func stroke_key_with_enum_in_seconds(key_enum:NesButton, delay_seconds:float, press_duration_seconds:float):
	var key_value = get_key_value_from_enum(key_enum)
	stroke_key_in_seconds(key_value, delay_seconds, press_duration_seconds)
#endregion

#region BUTTON_A
func press_a():
	press_key(button_a)

func release_a():
	release_key(button_a)

func stroke_a_no_delay():
	stroke_key_no_delay(button_a)

func set_down_up_key_a(value_down_up:bool):
	set_down_up_key(button_a, value_down_up)
#endregion
#region BUTTON_B
func press_b():
	press_key(button_b)

func release_b():
	release_key(button_b)

func stroke_b_no_delay():
	stroke_key_no_delay(button_b)

func set_down_up_key_b(value_down_up:bool):
	set_down_up_key(button_b, value_down_up)
#endregion
#region MENU_LEFT
func press_menu_left():
	press_key(button_menu_left)

func release_menu_left():
	release_key(button_menu_left)

func stroke_menu_left_no_delay():
	stroke_key_no_delay(button_menu_left)

func set_down_up_key_menu_left(value_down_up:bool):
	set_down_up_key(button_menu_left, value_down_up)
#endregion
#region MENU_RIGHT
func press_menu_right():
	press_key(button_menu_right)

func release_menu_right():
	release_key(button_menu_right)

func stroke_menu_right_no_delay():
	stroke_key_no_delay(button_menu_right)

func set_down_up_key_menu_right(value_down_up:bool):
	set_down_up_key(button_menu_right, value_down_up)
#endregion
#region ARROW_UP
func press_arrow_up():
	press_key(button_arrow_up)

func release_arrow_up():
	release_key(button_arrow_up)

func stroke_arrow_up_no_delay():
	stroke_key_no_delay(button_arrow_up)

func set_down_up_key_arrow_up(value_down_up:bool):
	set_down_up_key(button_arrow_up, value_down_up)
#endregion
#region ARROW_RIGHT
func press_arrow_right():
	press_key(button_arrow_right)

func release_arrow_right():
	release_key(button_arrow_right)

func stroke_arrow_right_no_delay():
	stroke_key_no_delay(button_arrow_right)

func set_down_up_key_arrow_right(value_down_up:bool):
	set_down_up_key(button_arrow_right, value_down_up)
#endregion
#region ARROW_DOWN
func press_arrow_down():
	press_key(button_arrow_down)

func release_arrow_down():
	release_key(button_arrow_down)

func stroke_arrow_down_no_delay():
	stroke_key_no_delay(button_arrow_down)

func set_down_up_key_arrow_down(value_down_up:bool):
	set_down_up_key(button_arrow_down, value_down_up)
#endregion


#region ARROW_LEFT
func press_arrow_left():
	press_key(button_arrow_left)

func release_arrow_left():
	release_key(button_arrow_left)

func stroke_arrow_left_no_delay():
	stroke_key_no_delay(button_arrow_left)

func set_down_up_key_arrow_left(value_down_up:bool):
	set_down_up_key(button_arrow_left, value_down_up)
#endregion


#region STROKE SHORT
func stroke_a_short():
	stroke_key_short(button_a)
func stroke_b_short():
	stroke_key_short(button_b)
func stroke_menu_left_short():
	stroke_key_short(button_menu_left)
func stroke_menu_right_short():
	stroke_key_short(button_menu_right)
func stroke_arrow_up_short():
	stroke_key_short(button_arrow_up)
func stroke_arrow_right_short():
	stroke_key_short(button_arrow_right)
func stroke_arrow_down_short():
	stroke_key_short(button_arrow_down)
func stroke_arrow_left_short():
	stroke_key_short(button_arrow_left)
#endregion


#region STROKE FOR MILLISECONDS
func stroke_a_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_a, press_duration_milliseconds)
func stroke_b_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_b, press_duration_milliseconds)
func stroke_menu_left_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_menu_left, press_duration_milliseconds)
func stroke_menu_right_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_menu_right, press_duration_milliseconds)
func stroke_arrow_up_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_arrow_up, press_duration_milliseconds)
func stroke_arrow_right_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_arrow_right, press_duration_milliseconds)
func stroke_arrow_down_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_arrow_down, press_duration_milliseconds)
func stroke_arrow_left_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_arrow_left, press_duration_milliseconds)
#endregion

#region STROKE FOR SECONDS
func stroke_a_for_seconds(press_duration_seconds:float):
	stroke_key_for_seconds(button_a, press_duration_seconds)
func stroke_b_for_seconds(press_duration_seconds:float):
	stroke_key_for_seconds(button_b, press_duration_seconds)
func stroke_menu_left_for_seconds(press_duration_seconds:float):
	stroke_key_for_seconds(button_menu_left, press_duration_seconds)
func stroke_menu_right_for_seconds(press_duration_seconds:float):
	stroke_key_for_seconds(button_menu_right, press_duration_seconds)
func stroke_arrow_up_for_seconds(press_duration_seconds:float):
	stroke_key_for_seconds(button_arrow_up, press_duration_seconds)
func stroke_arrow_right_for_seconds(press_duration_seconds:float):
	stroke_key_for_seconds(button_arrow_right, press_duration_seconds)
func stroke_arrow_down_for_seconds(press_duration_seconds:float):
	stroke_key_for_seconds(button_arrow_down, press_duration_seconds)
func stroke_arrow_left_for_seconds(press_duration_seconds:float):
	stroke_key_for_seconds(button_arrow_left, press_duration_seconds)
#endregion

#region STROKE IN MILLISECONDS
func stroke_a_in_milliseconds(delay_milliseconds:int, press_duration_milliseconds:int):
	stroke_key_in_milliseconds(button_a, delay_milliseconds, press_duration_milliseconds)
func stroke_b_in_milliseconds(delay_milliseconds:int, press_duration_milliseconds:int):
	stroke_key_in_milliseconds(button_b, delay_milliseconds, press_duration_milliseconds)
func stroke_menu_left_in_milliseconds(delay_milliseconds:int, press_duration_milliseconds:int):
	stroke_key_in_milliseconds(button_menu_left, delay_milliseconds, press_duration_milliseconds)
func stroke_menu_right_in_milliseconds(delay_milliseconds:int, press_duration_milliseconds:int):
	stroke_key_in_milliseconds(button_menu_right, delay_milliseconds, press_duration_milliseconds)
func stroke_arrow_up_in_milliseconds(delay_milliseconds:int, press_duration_milliseconds:int):
	stroke_key_in_milliseconds(button_arrow_up, delay_milliseconds, press_duration_milliseconds)
func stroke_arrow_right_in_milliseconds(delay_milliseconds:int, press_duration_milliseconds:int):
	stroke_key_in_milliseconds(button_arrow_right, delay_milliseconds, press_duration_milliseconds)
func stroke_arrow_down_in_milliseconds(delay_milliseconds:int, press_duration_milliseconds:int):
	stroke_key_in_milliseconds(button_arrow_down, delay_milliseconds, press_duration_milliseconds)
func stroke_arrow_left_in_milliseconds(delay_milliseconds:int, press_duration_milliseconds:int):
	stroke_key_in_milliseconds(button_arrow_left, delay_milliseconds, press_duration_milliseconds)
#endregion


#region STROKE IN SECONDS
func stroke_a_in_seconds(delay_seconds:float, press_duration_seconds:float):
	stroke_key_in_seconds(button_a, delay_seconds, press_duration_seconds)
func stroke_b_in_seconds(delay_seconds:float, press_duration_seconds:float):
	stroke_key_in_seconds(button_b, delay_seconds, press_duration_seconds)
func stroke_menu_left_in_seconds(delay_seconds:float, press_duration_seconds:float):
	stroke_key_in_seconds(button_menu_left, delay_seconds, press_duration_seconds)
func stroke_menu_right_in_seconds(delay_seconds:float, press_duration_seconds:float):
	stroke_key_in_seconds(button_menu_right, delay_seconds, press_duration_seconds)
func stroke_arrow_up_in_seconds(delay_seconds:float, press_duration_seconds:float):
	stroke_key_in_seconds(button_arrow_up, delay_seconds, press_duration_seconds)
func stroke_arrow_right_in_seconds(delay_seconds:float, press_duration_seconds:float):
	stroke_key_in_seconds(button_arrow_right, delay_seconds, press_duration_seconds)
func stroke_arrow_down_in_seconds(delay_seconds:float, press_duration_seconds:float):
	stroke_key_in_seconds(button_arrow_down, delay_seconds, press_duration_seconds)
func stroke_arrow_left_in_seconds(delay_seconds:float, press_duration_seconds:float):
	stroke_key_in_seconds(button_arrow_left, delay_seconds, press_duration_seconds)
#endregion



#region OVERRIDE BUTTONS
func override_button_a(new_value:int):
	button_a = new_value
func override_button_b(new_value:int):
	button_b = new_value	
func override_button_menu_left(new_value:int):
	button_menu_left = new_value
func override_button_menu_right(new_value:int):
	button_menu_right = new_value
func override_button_arrow_up(new_value:int):
	button_arrow_up = new_value
func override_button_arrow_right(new_value:int):
	button_arrow_right = new_value
func override_button_arrow_down(new_value:int):
	button_arrow_down = new_value
func override_button_arrow_left(new_value:int):
	button_arrow_left = new_value	
	

func override_b_as_xbox_x():
	button_b = 	1301
func override_b_as_xbox_y():
	button_b = 1303	
func override_b_as_xbox_b():
	button_b = 1302	
func override_b_as_xbox_a():
	button_b = 1300	

func override_b_as_xbox_side_button_left():
	button_b = 1304	
func override_b_as_xbox_side_button_right():
	button_b = 1305	
func override_b_as_xbox_stick_button_left():
	button_b = 1306	
func override_b_as_xbox_stick_button_right():
	button_b = 1307



# Some game use:
# stick left to move instead of arrows
func override_arrows_with_joystick_left():
	button_arrow_up =1352
	button_arrow_down =1353
	button_arrow_left =1351
	button_arrow_right =1350
	pass 

func override_arrows_with_joystick_right():
	button_arrow_up =1356
	button_arrow_down =1357
	button_arrow_left =1355
	button_arrow_right =1354
	pass 

# Some game use:
# stick left vertical for moving the character 
# stick right horizontal for rotating the character
func override_arrows_with_stick_left_vertical_stick_right_horizontal():
	button_arrow_up =1352
	button_arrow_down =1353
	button_arrow_left =1355
	button_arrow_right =1354
	pass 

func reset_arrows_to_default():
	override_button_arrow_up(1311)
	override_button_arrow_right(1313)
	override_button_arrow_down(1315)
	override_button_arrow_left(1317)

func reset_menu_to_default():
	override_button_menu_left(1309)
	override_button_menu_right(1308)

func reset_buttons_a_b_to_default():
	override_button_a(1300)
	override_button_b(1301)

func reset_all_keys_to_default():
	reset_arrows_to_default()
	reset_menu_to_default()
	reset_buttons_a_b_to_default()

#endregion

#region INVERSE OVERRIDE BUTTONS

func inverse_a_and_b():
	var temp = button_a
	button_a = button_b
	button_b = temp

func inverse_menu_left_and_right():
	var temp = button_menu_left
	button_menu_left = button_menu_right
	button_menu_right = temp

func release_all_keys():
	release_a()
	release_b()
	release_menu_left()
	release_menu_right()
	release_arrow_up()
	release_arrow_right()
	release_arrow_down()
	release_arrow_left()

#endregion


func set_down_up_key_with_enum(key_enum:NesButton, value_down_up:bool):
	var key_value = get_key_value_from_enum(key_enum)
	set_down_up_key(key_value, value_down_up)


func override_all_buttons_from_text(left:String, right:String, up:String, down:String, a:String, b:String, select:String, start:String):
	override_button_arrow_left(_parse_text_to_integer(left))
	override_button_arrow_right(_parse_text_to_integer(right))
	override_button_arrow_up(_parse_text_to_integer(up))
	override_button_arrow_down(_parse_text_to_integer(down))
	override_button_a(_parse_text_to_integer(a))
	override_button_b(_parse_text_to_integer(b))
	override_button_menu_left(_parse_text_to_integer(select))
	override_button_menu_right(_parse_text_to_integer(start))	


func override_all_buttons(left:int, right:int, up:int, down:int, a:int, b:int, select:int, start:int):
	override_button_arrow_left(left)
	override_button_arrow_right(right)
	override_button_arrow_up(up)
	override_button_arrow_down(down)
	override_button_a(a)
	override_button_b(b)
	override_button_menu_left(select)
	override_button_menu_right(start)



#region GET BUTTONS
func get_nes_button_arrow_up_as_int()->int:
	return button_arrow_up
func get_nes_button_arrow_right_as_int()->int:
	return button_arrow_right
func get_nes_button_arrow_down_as_int()->int:
	return button_arrow_down
func get_nes_button_arrow_left_as_int()->int:
	return button_arrow_left
func get_nes_button_a_as_int()->int:
	return button_a
func get_nes_button_b_as_int()->int:
	return button_b
func get_nes_button_menu_left_as_int()->int:
	return button_menu_left
func get_nes_button_menu_right_as_int()->int:
	return button_menu_right
#endregion



#region override button
func _parse_text_to_integer(text:String, error_value:int=0)->int:
	var parsed_value = int(text)
	if parsed_value == null:
		return error_value
	return int(text)

func _clamp_between_1000_1999(value:int)->int:
	if value>0 and value <1000:
		return value+1000
	if value>1999 and value <3000:
		return value-1000
	return value

func override_buttons_with_abstract_resource_int(resource: NesableGameMappingAbstractGet):
	button_a = _clamp_between_1000_1999(resource.get_button_a())
	button_b = _clamp_between_1000_1999(resource.get_button_b())
	button_menu_left = _clamp_between_1000_1999(resource.get_button_menu_left())
	button_menu_right = _clamp_between_1000_1999(resource.get_button_menu_right())
	button_arrow_up = _clamp_between_1000_1999(resource.get_button_arrow_up())
	button_arrow_down = _clamp_between_1000_1999(resource.get_button_arrow_down())
	button_arrow_left = _clamp_between_1000_1999(resource.get_button_arrow_left())
	button_arrow_right = _clamp_between_1000_1999(resource.get_button_arrow_right())


func override_buttons_with_resource_int( resource: NesableGameMappingInt):
	button_a = _clamp_between_1000_1999(resource.button_a)
	button_b = _clamp_between_1000_1999(resource.button_b)
	button_menu_left = _clamp_between_1000_1999(resource.menu_left)
	button_menu_right = _clamp_between_1000_1999(resource.menu_right)
	button_arrow_up = _clamp_between_1000_1999(resource.arrow_up)
	button_arrow_down = _clamp_between_1000_1999(resource.arrow_down)
	button_arrow_left = _clamp_between_1000_1999(resource.arrow_left)
	button_arrow_right = _clamp_between_1000_1999(resource.arrow_right)

func override_buttons_with_resource_keyboard( resource: NesableGameMappingKeyboard):
	button_a = _clamp_between_1000_1999(int(resource.button_a))
	button_b = _clamp_between_1000_1999(int(resource.button_b))
	button_menu_left = _clamp_between_1000_1999(int(resource.menu_left))
	button_menu_right = _clamp_between_1000_1999(int(resource.menu_right))
	button_arrow_up = _clamp_between_1000_1999(int(resource.arrow_up))
	button_arrow_down = _clamp_between_1000_1999(int(resource.arrow_down))
	button_arrow_left = _clamp_between_1000_1999(int(resource.arrow_left))
	button_arrow_right = _clamp_between_1000_1999(int(resource.arrow_right))

func override_buttons_with_resource_xbox( resource: NesableGameMappingXboxBasic):
	button_a = _clamp_between_1000_1999(int(resource.button_a))
	button_b = _clamp_between_1000_1999(int(resource.button_b))
	button_menu_left = _clamp_between_1000_1999(int(resource.menu_left))
	button_menu_right = _clamp_between_1000_1999(int(resource.menu_right))
	button_arrow_up = _clamp_between_1000_1999(int(resource.arrow_up))
	button_arrow_down = _clamp_between_1000_1999(int(resource.arrow_down))
	button_arrow_left = _clamp_between_1000_1999(int(resource.arrow_left))
	button_arrow_right = _clamp_between_1000_1999(int(resource.arrow_right))

func override_button_a_from_int_text(integer_as_text):
	button_a = _clamp_between_1000_1999(_parse_text_to_integer(integer_as_text))
func override_button_b_from_int_text(integer_as_text):
	button_b= _clamp_between_1000_1999(_parse_text_to_integer(integer_as_text))

func override_menu_left_from_int_text(integer_as_text):
	button_menu_left= _clamp_between_1000_1999(_parse_text_to_integer(integer_as_text))	
func override_menu_right_from_int_text(integer_as_text):
	button_menu_right= _clamp_between_1000_1999(_parse_text_to_integer(integer_as_text))
	
func override_arrow_up_from_int_text(integer_as_text):
	button_arrow_up= _clamp_between_1000_1999(_parse_text_to_integer(integer_as_text))
func override_arrow_down_from_int_text(integer_as_text):
	button_arrow_down= _clamp_between_1000_1999(_parse_text_to_integer(integer_as_text))
func override_arrow_left_from_int_text(integer_as_text):
	button_arrow_left= _clamp_between_1000_1999(_parse_text_to_integer(integer_as_text))
func override_arrow_right_from_int_text(integer_as_text):
	button_arrow_right= _clamp_between_1000_1999(_parse_text_to_integer(integer_as_text))

#endregion
