# class name It allows other script ot refert to it
class_name NesControllerToInt extends Node

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
	press_key_in_milliseconds(key_press_value, int(press_duration_seconds * 1000))

func release_key_in_seconds(key_press_value:int, release_delay_seconds:float):
	release_key_in_milliseconds(key_press_value, int(release_delay_seconds * 1000))


func stroke_key_for_milliseconds(key_press_value:int, press_duration_milliseconds:int):
	press_key(key_press_value)
	release_key_in_milliseconds(key_press_value, press_duration_milliseconds)

func stroke_key_for_seconds(key_press_value:int, press_duration_seconds:float):
	stroke_key_for_milliseconds(key_press_value, int(press_duration_seconds * 1000))

func stroke_key_in_milliseconds(key_press_value:int, delay_milliseconds:int, press_duration_milliseconds:int):
	press_key_in_milliseconds(key_press_value, press_duration_milliseconds)
	release_key_in_milliseconds(key_press_value, delay_milliseconds + press_duration_milliseconds)

func stroke_key_in_seconds(key_press_value:int, delay_seconds:float, press_duration_seconds:float):
	stroke_key_in_milliseconds(key_press_value, int(delay_seconds * 1000), int(press_duration_seconds * 1000))

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
	

func override_b_as_xbox_x(new_value:int):
	button_b = 	1301
func override_b_as_xbox_y(new_value:int):
	button_b = 1303	
func override_b_as_xbox_b(new_value:int):
	button_b = 1302	
func override_b_as_xbox_a(new_value:int):
	button_b = 1300	

func override_b_as_xbox_side_button_left(new_value:int):
	button_b = 1304	
func override_b_as_xbox_side_button_right(new_value:int):
	button_b = 1305	
func override_b_as_xbox_stick_button_left(new_value:int):
	button_b = 1306	
func override_b_as_xbox_stick_button_right(new_value:int):
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


func _on_nes_button_arrow_left_on_down_up(pressed: bool) -> void:
	pass # Replace with function body.
