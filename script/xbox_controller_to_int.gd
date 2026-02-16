# class name It allows other script ot refert to it
class_name XboxControllerToInt extends Node


enum XboxCommandBasic {
	BUTTON_DOWN_A = 1300,
	BUTTON_LEFT_X = 1301,
	BUTTON_RIGHT_B = 1302,
	BUTTON_UP_Y = 1303,

	BUTTON_LEFT_SIDE = 1304,
	BUTTON_RIGHT_SIDE = 1305,

	BUTTON_LEFT_STICK = 1306,
	BUTTON_RIGHT_STICK = 1307,

	BUTTON_MENU_RIGHT = 1308,
	BUTTON_MENU_LEFT = 1309,

	ARROW_UP = 1311,
	ARROW_RIGHT = 1313,
	ARROW_DOWN = 1315,
	ARROW_LEFT = 1317,

	XBOX_HOME_BUTTON = 1319,
	START_RECORDING = 1321,

	LEFT_TRIGGER_100 = 1358,
	RIGHT_TRIGGER_100 = 1359,

	LEFT_STICK_HORIZONTAL_P100 = 1350,
	LEFT_STICK_HORIZONTAL_N100 = 1351,
	LEFT_STICK_VERTICAL_P100 = 1352,
	LEFT_STICK_VERTICAL_N100 = 1353,

	RIGHT_STICK_HORIZONTAL_P100 = 1354,
	RIGHT_STICK_HORIZONTAL_N100 = 1355,
	RIGHT_STICK_VERTICAL_P100 = 1356,
	RIGHT_STICK_VERTICAL_N100 = 1357,



}


enum XboxCommandFull {
	# --- Face Buttons ---
	BUTTON_DOWN_A = 1300,
	BUTTON_LEFT_X = 1301,
	BUTTON_RIGHT_B = 1302,
	BUTTON_UP_Y = 1303,
	BUTTON_LEFT_SIDE = 1304,
	BUTTON_RIGHT_SIDE = 1305,
	BUTTON_LEFT_STICK = 1306,
	BUTTON_RIGHT_STICK = 1307,
	BUTTON_MENU_RIGHT = 1308,
	BUTTON_MENU_LEFT = 1309,

	# --- Arrows ---
	ARROW_RELEASE = 1310,
	ARROW_UP = 1311,
	ARROW_UP_RIGHT = 1312,
	ARROW_RIGHT = 1313,
	ARROW_DOWN_RIGHT = 1314,
	ARROW_DOWN = 1315,
	ARROW_DOWN_LEFT = 1316,
	ARROW_LEFT = 1317,
	ARROW_UP_LEFT = 1318,

	# --- System ---
	XBOX_HOME_BUTTON = 1319,
	RANDOM_AXIS = 1320,
	START_RECORDING = 1321,

	# --- Left Stick Directions ---
	LEFT_STICK_NEUTRAL = 1330,
	LEFT_STICK_UP = 1331,
	LEFT_STICK_UP_RIGHT = 1332,
	LEFT_STICK_RIGHT = 1333,
	LEFT_STICK_DOWN_RIGHT = 1334,
	LEFT_STICK_DOWN = 1335,
	LEFT_STICK_DOWN_LEFT = 1336,
	LEFT_STICK_LEFT = 1337,
	LEFT_STICK_UP_LEFT = 1338,

	# --- Right Stick Directions ---
	RIGHT_STICK_NEUTRAL = 1340,
	RIGHT_STICK_UP = 1341,
	RIGHT_STICK_UP_RIGHT = 1342,
	RIGHT_STICK_RIGHT = 1343,
	RIGHT_STICK_DOWN_RIGHT = 1344,
	RIGHT_STICK_DOWN = 1345,
	RIGHT_STICK_DOWN_LEFT = 1346,
	RIGHT_STICK_LEFT = 1347,
	RIGHT_STICK_UP_LEFT = 1348,

	# --- Stick 100% Axis ---
	LEFT_STICK_HORIZONTAL_P100 = 1350,
	LEFT_STICK_HORIZONTAL_N100 = 1351,
	LEFT_STICK_VERTICAL_P100 = 1352,
	LEFT_STICK_VERTICAL_N100 = 1353,
	RIGHT_STICK_HORIZONTAL_P100 = 1354,
	RIGHT_STICK_HORIZONTAL_N100 = 1355,
	RIGHT_STICK_VERTICAL_P100 = 1356,
	RIGHT_STICK_VERTICAL_N100 = 1357,

	# --- Trigger 100% ---
	LEFT_TRIGGER_100 = 1358,
	RIGHT_TRIGGER_100 = 1359,

	# --- Stick 75% Axis ---
	LEFT_STICK_HORIZONTAL_P75 = 1360,
	LEFT_STICK_HORIZONTAL_N75 = 1361,
	LEFT_STICK_VERTICAL_P75 = 1362,
	LEFT_STICK_VERTICAL_N75 = 1363,
	RIGHT_STICK_HORIZONTAL_P75 = 1364,
	RIGHT_STICK_HORIZONTAL_N75 = 1365,
	RIGHT_STICK_VERTICAL_P75 = 1366,
	RIGHT_STICK_VERTICAL_N75 = 1367,

	# --- Trigger 75% ---
	LEFT_TRIGGER_75 = 1368,
	RIGHT_TRIGGER_75 = 1369,

	# --- Stick 50% Axis ---
	LEFT_STICK_HORIZONTAL_P50 = 1370,
	LEFT_STICK_HORIZONTAL_N50 = 1371,
	LEFT_STICK_VERTICAL_P50 = 1372,
	LEFT_STICK_VERTICAL_N50 = 1373,
	RIGHT_STICK_HORIZONTAL_P50 = 1374,
	RIGHT_STICK_HORIZONTAL_N50 = 1375,
	RIGHT_STICK_VERTICAL_P50 = 1376,
	RIGHT_STICK_VERTICAL_N50 = 1377,

	# --- Trigger 50% ---
	LEFT_TRIGGER_50 = 1378,
	RIGHT_TRIGGER_50 = 1379,

	# --- Stick 25% Axis ---
	LEFT_STICK_HORIZONTAL_P25 = 1380,
	LEFT_STICK_HORIZONTAL_N25 = 1381,
	LEFT_STICK_VERTICAL_P25 = 1382,
	LEFT_STICK_VERTICAL_N25 = 1383,
	RIGHT_STICK_HORIZONTAL_P25 = 1384,
	RIGHT_STICK_HORIZONTAL_N25 = 1385,
	RIGHT_STICK_VERTICAL_P25 = 1386,
	RIGHT_STICK_VERTICAL_N25 = 1387,

	# --- Trigger 25% ---
	LEFT_TRIGGER_25 = 1388,
	RIGHT_TRIGGER_25 = 1389,

	# --- Global ---
	RELEASE_ALL_TOUCH = 1390,
	RELEASE_ALL_TOUCH_BUT_MENU = 1391,
	CLEAR_TIMED_COMMAND = 1398
}



#region BUTTONS AND AXES VALUES
@export_group("Input as S2W Xbox")
@export var button_down_a:int = 1300;
@export var button_left_x:int = 1301;
@export var button_right_b:int = 1302;
@export var button_up_y:int = 1303;
@export var button_left_side:int = 1304;
@export var button_right_side:int = 1305;
@export var button_left_stick:int = 1306;
@export var button_right_stick:int = 1307;
@export var button_menu_right:int = 1308;
@export var button_menu_left:int = 1309;
@export var arrow_release:int = 1310;
@export var arrow_up:int = 1311;
@export var arrow_up_right:int = 1312;
@export var arrow_right:int = 1313;
@export var arrow_down_right:int = 1314;
@export var arrow_down:int = 1315;
@export var arrow_down_left:int = 1316;
@export var arrow_left:int = 1317;
@export var arrow_up_left:int = 1318;
@export var xbox_home_button:int = 1319;
@export var random_axis:int = 1320;
@export var start_recording:int = 1321;
@export var left_stick_neutral:int = 1330;
@export var left_stick_up:int = 1331;
@export var left_stick_up_right:int = 1332;
@export var left_stick_right:int = 1333;
@export var left_stick_down_right:int = 1334;
@export var left_stick_down:int = 1335;
@export var left_stick_down_left:int = 1336;
@export var left_stick_left:int = 1337;
@export var left_stick_up_left:int = 1338;
@export var right_stick_neutral:int = 1340;
@export var right_stick_up:int = 1341;
@export var right_stick_up_right:int = 1342;
@export var right_stick_right:int = 1343;
@export var right_stick_down_right:int = 1344;
@export var right_stick_down:int = 1345;
@export var right_stick_down_left:int = 1346;
@export var right_stick_left:int = 1347;
@export var right_stick_up_left:int = 1348;
@export var left_trigger_100_percent:int = 1358;
@export var right_trigger_100_percent:int = 1359;
@export var left_trigger_75_percent:int = 1368;
@export var right_trigger_75_percent:int = 1369;
@export var left_trigger_50_percent:int = 1378;
@export var right_trigger_50_percent:int = 1379;
@export var left_trigger_25_percent:int = 1388;
@export var right_trigger_25_percent:int = 1389;
@export var left_stick_horizontal_p100_percent:int = 1350;
@export var left_stick_horizontal_n100_percent:int = 1351;
@export var left_stick_vertical_p100_percent:int = 1352;
@export var left_stick_vertical_n100_percent:int = 1353;
@export var right_stick_horizontal_p100_percent:int = 1354;
@export var right_stick_horizontal_n100_percent:int = 1355;
@export var right_stick_vertical_p100_percent:int = 1356;
@export var right_stick_vertical_n100_percent:int = 1357;
@export var left_stick_horizontal_p75_percent:int = 1360;
@export var left_stick_horizontal_n75_percent:int = 1361;
@export var left_stick_vertical_p75_percent:int = 1362;
@export var left_stick_vertical_n75_percent:int = 1363;
@export var right_stick_horizontal_p75_percent:int = 1364;
@export var right_stick_horizontal_n75_percent:int = 1365;
@export var right_stick_vertical_p75_percent:int = 1366;
@export var right_stick_vertical_n75_percent:int = 1367;
@export var left_stick_horizontal_p50_percent:int = 1370;
@export var left_stick_horizontal_n50_percent:int = 1371;
@export var left_stick_vertical_p50_percent:int = 1372;
@export var left_stick_vertical_n50_percent:int = 1373;
@export var right_stick_horizontal_p50_percent:int = 1374;
@export var right_stick_horizontal_n50_percent:int = 1375;
@export var right_stick_vertical_p50_percent:int = 1376;
@export var right_stick_vertical_n50_percent:int = 1377;
@export var left_stick_horizontal_p25_percent:int = 1380;
@export var left_stick_horizontal_n25_percent:int = 1381;
@export var left_stick_vertical_p25_percent:int = 1382;
@export var left_stick_vertical_n25_percent:int = 1383;
@export var right_stick_horizontal_p25_percent:int = 1384;
@export var right_stick_horizontal_n25_percent:int = 1385;
@export var right_stick_vertical_p25_percent:int = 1386;
@export var right_stick_vertical_n25_percent:int = 1387;
@export var release_all_touch:int = 1390;
@export var release_all_touch_but_menu:int = 1391;
@export var clear_timed_command:int = 1398;
#endregion

@export var use_print_debugging:bool

signal on_integer_to_send_requested(integer_action:int)
signal on_integer_with_millisecond_delay_to_send_requested(integer_action:int, delay_in_milliseconds:int)

#region GENERIC METHODE
func send_integer(integer_to_send:int):
	if use_print_debugging:
		print("Send Integer: ", integer_to_send)
	on_integer_to_send_requested.emit(integer_to_send)

func press_key(key_press_value:int):
	send_integer(key_press_value)

func release_key(key_press_value:int):
	send_integer(key_press_value + 1000)

func stroke_key_no_delay(key_press_value:int):
	press_key(key_press_value)
	release_key(key_press_value)

func press_key_in_milliseconds(key_press_value:int, press_duration_milliseconds:int):
	on_integer_with_millisecond_delay_to_send_requested.emit(key_press_value, press_duration_milliseconds)

func release_key_in_milliseconds(key_press_value:int, release_delay_milliseconds:int):
	on_integer_with_millisecond_delay_to_send_requested.emit(key_press_value + 1000, release_delay_milliseconds)

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

func set_key_down_up(key_press_value:int, value_down_up:bool):
	if value_down_up:
		press_key(key_press_value)
	else:
		release_key(key_press_value)

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


#region TRIGGER METHODS


func set_trigger_left_value_percent_01(percent_value:float):
	if percent_value <= 0.0:
		send_integer(left_trigger_25_percent+1000)
	elif percent_value < 0.25:
		send_integer(left_trigger_25_percent)
	elif percent_value < 0.5:
		send_integer(left_trigger_50_percent)
	elif percent_value < 0.75:
		send_integer(left_trigger_75_percent)
	else:
		send_integer(left_trigger_100_percent)

func set_trigger_right_value_percent_01(percent_value:float):
	if percent_value <= 0.0:
		send_integer(right_trigger_25_percent+1000)
	elif percent_value < 0.25:
		send_integer(right_trigger_25_percent)
	elif percent_value < 0.5:
		send_integer(right_trigger_50_percent)
	elif percent_value < 0.75:
		send_integer(right_trigger_75_percent)
	else:
		send_integer(right_trigger_100_percent)



func press_left_trigger():
	press_key(left_trigger_100_percent)

func release_left_trigger():
	release_key(left_trigger_100_percent)

func press_right_trigger():
	press_key(right_trigger_100_percent)

func release_right_trigger():
	release_key(right_trigger_100_percent)

#endregion


#region JOYSTICK METHODS
func set_left_stick_horizontal_value_percent_11(percent_value:float):
	if percent_value == 0.0:
		send_integer(left_stick_horizontal_p100_percent+1000)
	elif percent_value <= -1.0:
		send_integer(left_stick_horizontal_n100_percent)
	elif percent_value < -0.75:
		send_integer(left_stick_horizontal_n75_percent)
	elif percent_value < -0.5:
		send_integer(left_stick_horizontal_n50_percent)
	elif percent_value < -0.25:
		send_integer(left_stick_horizontal_n25_percent)
	elif percent_value < 0.25:
		# left stick neutral set the both to zero that why I use the inverse of the horizontal value
		send_integer(left_stick_horizontal_p100_percent+1000)
	elif percent_value < 0.5:
		send_integer(left_stick_horizontal_p25_percent)
	elif percent_value < 0.75:
		send_integer(left_stick_horizontal_p50_percent)
	elif percent_value < 1.0:
		send_integer(left_stick_horizontal_p75_percent)
	elif percent_value >= 1.0:
		send_integer(left_stick_horizontal_p100_percent)

func set_left_stick_vertical_value_percent_11(percent_value:float):
	if percent_value == 0.0:
		send_integer(left_stick_vertical_p100_percent+1000)
	elif percent_value <= -1.0:
		send_integer(left_stick_vertical_n100_percent)
	elif percent_value < -0.75:
		send_integer(left_stick_vertical_n75_percent)
	elif percent_value < -0.5:
		send_integer(left_stick_vertical_n50_percent)
	elif percent_value < -0.25:
		send_integer(left_stick_vertical_n25_percent)
	elif percent_value < 0.25:
		# stick neutral set the both to zero that why I use the inverse of the vertical value
		send_integer(left_stick_vertical_p100_percent+1000)
	elif percent_value < 0.5:
		send_integer(left_stick_vertical_p25_percent)
	elif percent_value < 0.75:
		send_integer(left_stick_vertical_p50_percent)
	elif percent_value < 1.0:
		send_integer(left_stick_vertical_p75_percent)
	elif percent_value >= 1.0:
		send_integer(left_stick_vertical_p100_percent)
	

func set_right_stick_horizontal_value_percent_11(percent_value:float):
	if percent_value == 0.0:
		send_integer(right_stick_horizontal_p100_percent+1000)
	elif percent_value <= -1.0:
		send_integer(right_stick_horizontal_n100_percent)
	elif percent_value < -0.75:
		send_integer(right_stick_horizontal_n75_percent)
	elif percent_value < -0.5:
		send_integer(right_stick_horizontal_n50_percent)
	elif percent_value < -0.25:
		send_integer(right_stick_horizontal_n25_percent)
	elif percent_value < 0.25:
		# right stick neutral set the both to zero that why I use the inverse of the horizontal value
		send_integer(right_stick_horizontal_p100_percent+1000)
	elif percent_value < 0.5:
		send_integer(right_stick_horizontal_p25_percent)
	elif percent_value < 0.75:
		send_integer(right_stick_horizontal_p50_percent)
	elif percent_value < 1.0:
		send_integer(right_stick_horizontal_p75_percent)
	elif percent_value >= 1.0:
		send_integer(right_stick_horizontal_p100_percent)

func set_right_stick_vertical_value_percent_11(percent_value:float):
	if percent_value == 0.0:
		send_integer(right_stick_vertical_p100_percent+1000)
	elif percent_value <= -1.0:
		send_integer(right_stick_vertical_n100_percent)
	elif percent_value < -0.75:
		send_integer(right_stick_vertical_n75_percent)
	elif percent_value < -0.5:
		send_integer(right_stick_vertical_n50_percent)
	elif percent_value < -0.25:
		send_integer(right_stick_vertical_n25_percent)
	elif percent_value < 0.25:
		# stick neutral set the both to zero that why I use the inverse of the vertical value
		send_integer(right_stick_vertical_p100_percent+1000)
	elif percent_value < 0.5:
		send_integer(right_stick_vertical_p25_percent)
	elif percent_value < 0.75:
		send_integer(right_stick_vertical_p50_percent)
	elif percent_value < 1.0:
		send_integer(right_stick_vertical_p75_percent)
	elif percent_value >= 1.0:
		send_integer(right_stick_vertical_p100_percent)


func set_joystick_left_with_percent_11(x_percent:float, y_percent:float):
	set_left_stick_horizontal_value_percent_11(x_percent)
	set_left_stick_vertical_value_percent_11(y_percent)

func set_joystick_right_with_percent_11(x_percent:float, y_percent:float):
	set_right_stick_horizontal_value_percent_11(x_percent)
	set_right_stick_vertical_value_percent_11(y_percent)
#endregion

	
#region PRESS KEY METHODS

func press_key_a():
	press_key(button_down_a)
func press_key_b():
	press_key(button_right_b)
func press_key_x():
	press_key(button_up_y)
func press_key_y():
	press_key(button_left_x)

func press_key_left_side_button():
	press_key(button_left_side)
func press_key_right_side_button():
	press_key(button_right_side)

func press_key_left_stick():
	press_key(button_left_stick)
func press_key_right_stick():
	press_key(button_right_stick)

func press_key_menu_right():
	press_key(button_menu_right)
func press_key_menu_left():
	press_key(button_menu_left)

func press_key_xbox_home_button():
	press_key(xbox_home_button)

func press_key_arrow_up():
	press_key(arrow_up)
func press_key_arrow_up_right():
	press_key(arrow_up_right)
func press_key_arrow_right():
	press_key(arrow_right)
func press_key_arrow_down_right():
	press_key(arrow_down_right)
func press_key_arrow_down():
	press_key(arrow_down)
func press_key_arrow_down_left():
	press_key(arrow_down_left)
func press_key_arrow_left():
	press_key(arrow_left)
func press_key_arrow_up_left():
	press_key(arrow_up_left)	

#endregion

#region RELEASE KEY METHODS

func release_key_a():
	release_key(button_down_a)
func release_key_b():
	release_key(button_right_b)
func release_key_x():
	release_key(button_up_y)
func release_key_y():
	release_key(button_left_x)

func release_key_left_side_button():
	release_key(button_left_side)
func release_key_right_side_button():
	release_key(button_right_side)

func release_key_left_stick():
	release_key(button_left_stick)
func release_key_right_stick():
	release_key(button_right_stick)	

func release_key_menu_right():
	release_key(button_menu_right)
func release_key_menu_left():
	release_key(button_menu_left)

func release_key_xbox_home_button():
	release_key(xbox_home_button)

func release_key_arrow_up():
	release_key(arrow_up)
func release_key_arrow_up_right():
	release_key(arrow_up_right)
func release_key_arrow_right():
	release_key(arrow_right)
func release_key_arrow_down_right():
	release_key(arrow_down_right)
func release_key_arrow_down():
	release_key(arrow_down)
func release_key_arrow_down_left():
	release_key(arrow_down_left)
func release_key_arrow_left():
	release_key(arrow_left)
func release_key_arrow_up_left():
	release_key(arrow_up_left)	

#endregion


#region SET KEY DOWN UP METHODS
func set_key_a(is_down:bool):
	set_key_down_up(button_down_a, is_down)
func set_key_b(is_down:bool):
	set_key_down_up(button_right_b, is_down)
func set_key_x(is_down:bool):
	set_key_down_up(button_left_x, is_down)
func set_key_y(is_down:bool):
	set_key_down_up(button_up_y, is_down)

func set_key_left_side_button(is_down:bool):
	set_key_down_up(button_left_side, is_down)
func set_key_right_side_button(is_down:bool):
	set_key_down_up(button_right_side, is_down)

func set_key_left_stick(is_down:bool):
	set_key_down_up(button_left_stick, is_down)
func set_key_right_stick(is_down:bool):
	set_key_down_up(button_right_stick, is_down)

func set_key_menu_right(is_down:bool):
	set_key_down_up(button_menu_right, is_down)
func set_key_menu_left(is_down:bool):
	set_key_down_up(button_menu_left, is_down)

func set_key_xbox_home_button(is_down:bool):
	set_key_down_up(xbox_home_button, is_down)

func set_key_arrow_up(is_down:bool):
	set_key_down_up(arrow_up, is_down)
func set_key_arrow_up_right(is_down:bool):
	set_key_down_up(arrow_up_right, is_down)
func set_key_arrow_right(is_down:bool):
	set_key_down_up(arrow_right, is_down)
func set_key_arrow_down_right(is_down:bool):
	set_key_down_up(arrow_down_right, is_down)
func set_key_arrow_down(is_down:bool):
	set_key_down_up(arrow_down, is_down)
func set_key_arrow_down_left(is_down:bool):
	set_key_down_up(arrow_down_left, is_down)
func set_key_arrow_left(is_down:bool):
	set_key_down_up(arrow_left, is_down)
func set_key_arrow_up_left(is_down:bool):
	set_key_down_up(arrow_up_left, is_down)	
#endregion


#region STROKE KEY FOR MILLISECONDS METHODS


func stroke_key_a_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_down_a, press_duration_milliseconds)
func stroke_key_b_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_right_b, press_duration_milliseconds)
func stroke_key_x_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_left_x, press_duration_milliseconds)
func stroke_key_y_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_up_y, press_duration_milliseconds)

func stroke_key_left_side_button_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_left_side, press_duration_milliseconds)
func stroke_key_right_side_button_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_right_side, press_duration_milliseconds)

func stroke_key_left_stick_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_left_stick, press_duration_milliseconds)
func stroke_key_right_stick_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_right_stick, press_duration_milliseconds)

func stroke_key_menu_right_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_menu_right, press_duration_milliseconds)
func stroke_key_menu_left_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(button_menu_left, press_duration_milliseconds)

func stroke_key_xbox_home_button_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(xbox_home_button, press_duration_milliseconds)

func stroke_key_arrow_up_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(arrow_up, press_duration_milliseconds)
func stroke_key_arrow_up_right_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(arrow_up_right, press_duration_milliseconds)
func stroke_key_arrow_right_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(arrow_right, press_duration_milliseconds)
func stroke_key_arrow_down_right_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(arrow_down_right, press_duration_milliseconds)
func stroke_key_arrow_down_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(arrow_down, press_duration_milliseconds)
func stroke_key_arrow_down_left_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(arrow_down_left, press_duration_milliseconds)
func stroke_key_arrow_left_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(arrow_left, press_duration_milliseconds)
func stroke_key_arrow_up_left_for_milliseconds(press_duration_milliseconds:int):
	stroke_key_for_milliseconds(arrow_up_left, press_duration_milliseconds)	

#endregion


#region Triple for Debugging

func triple_stroke_a_short_for_debug():
	triple_click(button_down_a, 500,500)
func triple_stroke_a_long_for_debug():
	triple_click(button_down_a, 2000,2000)
	
func joystick_left_vertical_forward_for_10_seconds():
	press_key(left_stick_vertical_p100_percent)
	release_key_in_seconds(left_stick_vertical_p100_percent,10)
	
func joystick_left_horizontal_right_for_10_seconds():
	press_key(left_stick_horizontal_p100_percent)
	release_key_in_seconds(left_stick_horizontal_p100_percent,10)
	
	
func joystick_right_vertical_forward_for_10_seconds():
	press_key(right_stick_vertical_p100_percent)
	release_key_in_seconds(right_stick_vertical_p100_percent,10)
	
func joystick_right_horizontal_right_for_10_seconds():
	press_key(right_stick_horizontal_p100_percent)
	release_key_in_seconds(right_stick_horizontal_p100_percent,10)
	
#endregion
	
	
	
	
#region ENUM BASIC USE

func get_key_value_from_enum(key_enum:XboxCommandBasic) -> int:
	match key_enum:
		XboxCommandBasic.BUTTON_DOWN_A:
			return button_down_a
		XboxCommandBasic.BUTTON_LEFT_X:
			return button_left_x
		XboxCommandBasic.BUTTON_RIGHT_B:
			return button_right_b
		XboxCommandBasic.BUTTON_UP_Y:
			return button_up_y
		XboxCommandBasic.BUTTON_LEFT_SIDE:
			return button_left_side
		XboxCommandBasic.BUTTON_RIGHT_SIDE:
			return button_right_side
		XboxCommandBasic.BUTTON_LEFT_STICK:
			return button_left_stick
		XboxCommandBasic.BUTTON_RIGHT_STICK:
			return button_right_stick
		XboxCommandBasic.BUTTON_MENU_RIGHT:
			return button_menu_right
		XboxCommandBasic.BUTTON_MENU_LEFT:
			return button_menu_left
		XboxCommandBasic.ARROW_UP:
			return arrow_up
		XboxCommandBasic.ARROW_RIGHT:
			return arrow_right
		XboxCommandBasic.ARROW_DOWN:
			return arrow_down
		XboxCommandBasic.ARROW_LEFT:
			return arrow_left
		XboxCommandBasic.XBOX_HOME_BUTTON:
			return xbox_home_button
		XboxCommandBasic.START_RECORDING:
			return start_recording
		XboxCommandBasic.LEFT_TRIGGER_100:
			return left_trigger_100_percent
		XboxCommandBasic.RIGHT_TRIGGER_100:
			return right_trigger_100_percent
		XboxCommandBasic.LEFT_STICK_HORIZONTAL_P100:
			return left_stick_horizontal_p100_percent
		XboxCommandBasic.LEFT_STICK_HORIZONTAL_N100:
			return left_stick_horizontal_n100_percent
		XboxCommandBasic.LEFT_STICK_VERTICAL_P100:
			return left_stick_vertical_p100_percent
		XboxCommandBasic.LEFT_STICK_VERTICAL_N100:
			return left_stick_vertical_n100_percent
		XboxCommandBasic.RIGHT_STICK_HORIZONTAL_P100:
			return right_stick_horizontal_p100_percent
		XboxCommandBasic.RIGHT_STICK_HORIZONTAL_N100:
			return right_stick_horizontal_n100_percent
		XboxCommandBasic.RIGHT_STICK_VERTICAL_P100:
			return right_stick_vertical_p100_percent
		XboxCommandBasic.RIGHT_STICK_VERTICAL_N100:
			return right_stick_vertical_n100_percent
		_:
			return -1

func send_enum_integer(integer_to_send:XboxCommandBasic):
	if use_print_debugging:
		print("Send Integer: ", integer_to_send)
	on_integer_to_send_requested.emit(integer_to_send)

func press_enum_key(key_press_value:XboxCommandBasic):
	send_enum_integer(key_press_value)

func release_enum_key(key_press_value:XboxCommandBasic):
	send_enum_integer(key_press_value + 1000)

func stroke_enum_key_no_delay(key_press_value:XboxCommandBasic):
	press_enum_key(key_press_value)
	release_enum_key(key_press_value)

func press_enum_key_in_milliseconds(key_press_value:XboxCommandBasic, press_duration_milliseconds:int):
	on_integer_with_millisecond_delay_to_send_requested.emit(key_press_value, press_duration_milliseconds)

func release_enum_key_in_milliseconds(key_press_value:XboxCommandBasic, release_delay_milliseconds:int):
	on_integer_with_millisecond_delay_to_send_requested.emit(key_press_value + 1000, release_delay_milliseconds)

func press_enum_key_in_seconds(key_press_value:XboxCommandBasic, press_duration_seconds:float):
	press_enum_key_in_milliseconds(key_press_value, int(press_duration_seconds * 1000))

func release_enum_key_in_seconds(key_press_value:XboxCommandBasic, release_delay_seconds:float):
	release_enum_key_in_milliseconds(key_press_value, int(release_delay_seconds * 1000))


func stroke_enum_key_for_milliseconds(key_press_value:XboxCommandBasic, press_duration_milliseconds:int):
	press_enum_key(key_press_value)
	release_enum_key_in_milliseconds(key_press_value, press_duration_milliseconds)

func stroke_enum_key_for_seconds(key_press_value:XboxCommandBasic, press_duration_seconds:float):
	stroke_enum_key_for_milliseconds(key_press_value, int(press_duration_seconds * 1000))

func stroke_enum_key_in_milliseconds(key_press_value:XboxCommandBasic, delay_milliseconds:int, press_duration_milliseconds:int):
	press_enum_key_in_milliseconds(key_press_value, press_duration_milliseconds)
	release_enum_key_in_milliseconds(key_press_value, delay_milliseconds + press_duration_milliseconds)

func stroke_enum_key_in_seconds(key_press_value:XboxCommandBasic, delay_seconds:float, press_duration_seconds:float):
	stroke_enum_key_in_milliseconds(key_press_value, int(delay_seconds * 1000), int(press_duration_seconds * 1000))

func set_enum_key_down_up(key_press_value:XboxCommandBasic, value_down_up:bool):
	if value_down_up:
		press_enum_key(key_press_value)
	else:
		release_enum_key(key_press_value)

func several_enum_click(key_press_value:XboxCommandBasic, number_of_clicks:int, delay_between_clicks_milliseconds:int, press_duration_milliseconds:int):
	var time_relative = 0
	for i in range(number_of_clicks):
		press_enum_key_in_milliseconds(key_press_value, time_relative)
		time_relative += press_duration_milliseconds
		release_enum_key_in_milliseconds(key_press_value, time_relative)
		time_relative += delay_between_clicks_milliseconds

func double_enum_click(key_press_value:XboxCommandBasic, delay_between_clicks_milliseconds:int, press_duration_milliseconds:int):
	several_enum_click(key_press_value, 2, delay_between_clicks_milliseconds, press_duration_milliseconds)

func triple_enum_click(key_press_value:XboxCommandBasic, delay_between_clicks_milliseconds:int, press_duration_milliseconds:int):
	several_enum_click(key_press_value, 3, delay_between_clicks_milliseconds, press_duration_milliseconds)	




#endregion


	
	
	
	
