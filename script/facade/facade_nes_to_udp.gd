class_name FacadeNesToUdp
extends Node

signal on_send_int_to_target(new_value:int)

@export_group("Main Component")
@export var udp_sender: NesSendIntegerMessageUdp
@export var nes_pad: NesControllerToInt
@export var int_delayer: NesIntDelayer
@export var xbox: XboxControllerToInt
@export var keyboard: KeyboardControllerToInt
	
@export var target_at_init:NesResTargetPlayerByUdp

@export_group("For Debugging (Do not touch)")
@export var last_sent_int_to_target:int
@export var target_ipv4:String
@export var target_port:int
@export var target_index:int
@export var waiting_command_in_queue:int

func _update_last_sent_int_to_target(new_value:int):
	last_sent_int_to_target = new_value
	on_send_int_to_target.emit(new_value)

func _init() -> void:
	if target_at_init != null:
		udp_sender.set_target_ipv4(target_at_init.target_ip)
		udp_sender.set_target_port(target_at_init.target_port)
		udp_sender.set_target_player_index(target_at_init.target_player_index)
		print("Target set at init: " + target_at_init.target_ip + ":" + str(target_at_init.target_port) + " player index: " + str(target_at_init.target_player_index))

func _ready() -> void:
	if udp_sender != null:
		udp_sender.on_integer_sent.connect(_update_last_sent_int_to_target)


func _process(delta: float) -> void:
	target_ipv4 = udp_sender.ipv4_to_target
	target_port = udp_sender.port_to_target
	target_index = udp_sender.player_to_target
	waiting_command_in_queue = int_delayer.get_waiting_command_in_queue()

	
#region GET MAIN COMPONENTS
func get_nes()-> NesControllerToInt:
	return nes_pad
func get_udp_sender()-> NesSendIntegerMessageUdp:
	return udp_sender

func get_int_delayer()-> NesIntDelayer:
	return int_delayer
	
func get_xbox()->XboxControllerToInt:
	return xbox

func get_keyboard()->KeyboardControllerToInt:
	return keyboard
#endregion

#region UDP SENDER ACCESS

func set_target_ipv4(new_ipv4:String):
	get_udp_sender().set_target_ipv4(new_ipv4)

func set_target_port(new_port:String):
	get_udp_sender().set_target_port(new_port)

func set_target_index(new_index:String):
	get_udp_sender().set_target_player_index(new_index)

func get_signal_on_send_int_to_target():
	return get_udp_sender().on_send_int_to_target
func get_signal_on_send_index_int_to_target():
	return get_udp_sender().on_integer_sent_with_player_index

func get_target_ipv4()->String:
	return get_udp_sender().ipv4_to_target

func get_target_port()->int:
	return get_udp_sender().port_to_target

func get_target_index()->int:
	return get_udp_sender().player_to_target

func send_integer_to_target_in_seconds(new_value:int, seconds_delay:float):
	get_int_delayer().add_action_to_delay_as_integer_in_seconds(new_value, seconds_delay)

func send_integer_to_target_in_milliseconds(new_value:int, milliseconds_delay:int):
	get_int_delayer().add_action_to_delay_as_integer_in_milliseconds(new_value, milliseconds_delay)

func send_integer_to_target(new_value:int):
	get_udp_sender().send_integer_to_target(new_value)

func send_custom_index_integer_to_target(target_index:int,new_value:int):
	get_udp_sender().send_index_integer_to_target(target_index, new_value)

#endregion

#region NES ACCESS

func nes_get_key_value_from_enum(key_enum:NesControllerToInt.NesButton) -> int:
	return get_nes().get_key_value_from_enum(key_enum)

func nes_press_key_with_pression_type(key_enum:NesControllerToInt.NesButton, press_type:NesControllerToInt.PressType):
	return get_nes().press_key_with_enum_and_pression_type(key_enum, press_type)

func nes_press_key_in_milliseconds(key_enum:NesControllerToInt.NesButton, delay_milliseconds:int):
	return get_nes().press_key_with_enum_in_milliseconds(key_enum, delay_milliseconds)

func nes_release_key_in_milliseconds(key_enum:NesControllerToInt.NesButton, delay_milliseconds:int):
	return get_nes().release_key_with_enum_in_milliseconds(key_enum, delay_milliseconds)

func nes_press_key_in_seconds(key_enum:NesControllerToInt.NesButton, delay_seconds:float):
	return get_nes().press_key_with_enum_in_seconds(key_enum, delay_seconds)

func nes_release_key_in_seconds(key_enum:NesControllerToInt.NesButton, delay_seconds:float):
	return get_nes().release_key_with_enum_in_seconds(key_enum, delay_seconds)

func nes_stroke_key_for_milliseconds(key_enum:NesControllerToInt.NesButton, press_duration_milliseconds:int):
	return get_nes().stroke_key_with_enum_for_milliseconds(key_enum, press_duration_milliseconds)

func nes_stroke_key_for_seconds(key_enum:NesControllerToInt.NesButton, press_duration_seconds:float):
	return get_nes().stroke_key_with_enum_for_seconds(key_enum, press_duration_seconds)

func nes_stroke_key_in_milliseconds(key_enum:NesControllerToInt.NesButton, delay_milliseconds:int, press_duration_milliseconds:int):
	return get_nes().stroke_key_with_enum_in_milliseconds(key_enum, delay_milliseconds, press_duration_milliseconds)

func nes_stroke_key_in_seconds(key_enum:NesControllerToInt.NesButton, delay_seconds:float, press_duration_seconds:float):
	return get_nes().stroke_key_with_enum_in_seconds(key_enum, delay_seconds, press_duration_seconds)

#endregion

#region XBOX ACCESS

func xbox_get_key_value_from_enum(key_enum:XboxControllerToInt.XboxCommandBasic) -> int:
	return get_xbox().get_key_value_from_enum(key_enum)

func xbox_send_enum_integer(integer_to_send:XboxControllerToInt.XboxCommandBasic):
	get_xbox().send_enum_integer(integer_to_send)
	
func xbox_press_enum_key(key_press_value:XboxControllerToInt.XboxCommandBasic):\
	get_xbox().press_enum_key(key_press_value)

func xbox_release_enum_key(key_press_value:XboxControllerToInt.XboxCommandBasic):
	get_xbox().release_enum_key(key_press_value)
	
func xbox_stroke_enum_key_no_delay(key_press_value:XboxControllerToInt.XboxCommandBasic):
	get_xbox().stroke_enum_key_no_delay(key_press_value)
	
func xbox_press_enum_key_in_milliseconds(key_press_value:XboxControllerToInt.XboxCommandBasic, press_duration_milliseconds:int):
	get_xbox().press_enum_key_in_milliseconds(key_press_value, press_duration_milliseconds)
	
func xbox_release_enum_key_in_milliseconds(key_press_value:XboxControllerToInt.XboxCommandBasic, release_delay_milliseconds:int):
	get_xbox().release_enum_key_in_milliseconds(key_press_value, release_delay_milliseconds)
	
func xbox_press_enum_key_in_seconds(key_press_value:XboxControllerToInt.XboxCommandBasic, press_duration_seconds:float):
	get_xbox().press_enum_key_in_seconds(key_press_value, press_duration_seconds)
	
func xbox_release_enum_key_in_seconds(key_press_value:XboxControllerToInt.XboxCommandBasic, release_delay_seconds:float):
	get_xbox().release_enum_key_in_seconds(key_press_value, release_delay_seconds)
	
func xbox_stroke_enum_key_for_milliseconds(key_press_value:XboxControllerToInt.XboxCommandBasic, press_duration_milliseconds:int):
	get_xbox().stroke_enum_key_for_milliseconds(key_press_value, press_duration_milliseconds)

func xbox_stroke_enum_key_for_seconds(key_press_value:XboxControllerToInt.XboxCommandBasic, press_duration_seconds:float):
	get_xbox().stroke_enum_key_for_seconds(key_press_value, press_duration_seconds)

func xbox_stroke_enum_key_in_milliseconds(key_press_value:XboxControllerToInt.XboxCommandBasic, delay_milliseconds:int, press_duration_milliseconds:int):
	get_xbox().stroke_enum_key_in_milliseconds(key_press_value, delay_milliseconds, press_duration_milliseconds)

func xbox_stroke_enum_key_in_seconds(key_press_value:XboxControllerToInt.XboxCommandBasic, delay_seconds:float, press_duration_seconds:float):
	get_xbox().stroke_enum_key_in_seconds(key_press_value, delay_seconds, press_duration_seconds)

func xbox_set_enum_key_down_up(key_press_value:XboxControllerToInt.XboxCommandBasic, value_down_up:bool):
	get_xbox().set_enum_key_down_up(key_press_value, value_down_up)

func xbox_several_enum_click(key_press_value:XboxControllerToInt.XboxCommandBasic, number_of_clicks:int, delay_between_clicks_milliseconds:int, press_duration_milliseconds:int):
	get_xbox().several_enum_click(key_press_value, number_of_clicks, delay_between_clicks_milliseconds, press_duration_milliseconds)

func xbox_double_enum_click(key_press_value:XboxControllerToInt.XboxCommandBasic, delay_between_clicks_milliseconds:int, press_duration_milliseconds:int):
	get_xbox().double_enum_click(key_press_value, delay_between_clicks_milliseconds, press_duration_milliseconds)

func xbox_triple_enum_click(key_press_value:XboxControllerToInt.XboxCommandBasic, delay_between_clicks_milliseconds:int, press_duration_milliseconds:int):
	get_xbox().triple_enum_click(key_press_value, delay_between_clicks_milliseconds, press_duration_milliseconds)



#endregion


#region KEYBOARD ACCESS

func keyboard_get_key_value_from_enum(key_enum:KeyboardControllerToInt.KeyboardCommandInt) -> int:
	return get_keyboard().get_key_value_from_enum(key_enum)

func keyboard_press_enum_key(enum_key:KeyboardControllerToInt.KeyboardCommandInt):
	get_keyboard().press_key(enum_key)

func keyboard_release_enum_key(enum_key:KeyboardControllerToInt.KeyboardCommandInt):
	get_keyboard().release_key(enum_key)

func keyboard_stroke_enum_key_no_delay(enum_key:KeyboardControllerToInt.KeyboardCommandInt):
	get_keyboard().stroke_key_no_delay(enum_key)

func keyboard_press_enum_key_in_milliseconds(enum_key:KeyboardControllerToInt.KeyboardCommandInt, press_duration_milliseconds:int):
	get_keyboard().press_key_in_milliseconds(enum_key, press_duration_milliseconds)

func keyboard_release_enum_key_in_milliseconds(enum_key:KeyboardControllerToInt.KeyboardCommandInt, release_delay_milliseconds:int):
	get_keyboard().release_key_in_milliseconds(enum_key, release_delay_milliseconds)

func keyboard_press_enum_key_in_seconds(enum_key:KeyboardControllerToInt.KeyboardCommandInt, press_duration_seconds:float):
	get_keyboard().press_key_in_seconds(enum_key, press_duration_seconds)

func keyboard_release_enum_key_in_seconds(enum_key:KeyboardControllerToInt.KeyboardCommandInt, release_delay_seconds:float):
	get_keyboard().release_key_in_seconds(enum_key, release_delay_seconds)


func keyboard_stroke_enum_key_for_milliseconds(enum_key:KeyboardControllerToInt.KeyboardCommandInt, press_duration_milliseconds:int):
	get_keyboard().stroke_key_for_milliseconds(enum_key, press_duration_milliseconds)

func keyboard_stroke_enum_key_for_seconds(enum_key:KeyboardControllerToInt.KeyboardCommandInt, press_duration_seconds:float):
	get_keyboard().stroke_key_for_seconds(enum_key, press_duration_seconds)


func keyboard_stroke_enum_key_in_milliseconds(enum_key:KeyboardControllerToInt.KeyboardCommandInt, delay_milliseconds:int, press_duration_milliseconds:int):
	get_keyboard().stroke_key_in_milliseconds(enum_key, delay_milliseconds, press_duration_milliseconds)


func keyboard_stroke_enum_key_in_seconds(enum_key:KeyboardControllerToInt.KeyboardCommandInt	, delay_seconds:float, press_duration_seconds:float):
	get_keyboard().stroke_key_in_seconds(enum_key, delay_seconds, press_duration_seconds)

func keyboard_several_enum_click(enum_key:KeyboardControllerToInt.KeyboardCommandInt, number_of_clicks:int, delay_between_clicks_milliseconds:int, press_duration_milliseconds:int):
	get_keyboard().several_click(enum_key, number_of_clicks, delay_between_clicks_milliseconds, press_duration_milliseconds)

func keyboard_double_enum_click(enum_key:KeyboardControllerToInt.KeyboardCommandInt, delay_between_clicks_milliseconds:int, press_duration_milliseconds:int):
	get_keyboard().double_click(enum_key, delay_between_clicks_milliseconds, press_duration_milliseconds)

func keyboard_triple_enum_click(enum_key:KeyboardControllerToInt.KeyboardCommandInt, delay_between_clicks_milliseconds:int, press_duration_milliseconds:int):
	get_keyboard().triple_click(enum_key, delay_between_clicks_milliseconds, press_duration_milliseconds)


#endregion

	

func override_all_nes_buttons(gauche:int, droite:int, haut:int, bas:int, a:int, b:int, select:int, start:int):
	get_nes().override_all_buttons(gauche, droite, haut, bas, a, b, select, start)

func override_all_nes_buttons_with_xbox(left:XboxControllerToInt.XboxCommandBasic,
	right:XboxControllerToInt.XboxCommandBasic,
	up:XboxControllerToInt.XboxCommandBasic,
	down:XboxControllerToInt.XboxCommandBasic,
	a:XboxControllerToInt.XboxCommandBasic,
	b:XboxControllerToInt.XboxCommandBasic,
	select:XboxControllerToInt.XboxCommandBasic,
	start:XboxControllerToInt.XboxCommandBasic):
	override_all_nes_buttons(int(left), int(right), int(up), int(down), int(a), int(b), int(select), int(start))

func override_all_nes_buttons_with_keyboard(left:KeyboardControllerToInt.KeyboardCommandInt,
	right:KeyboardControllerToInt.KeyboardCommandInt,
	up:KeyboardControllerToInt.KeyboardCommandInt,
	down:KeyboardControllerToInt.KeyboardCommandInt,
	a:KeyboardControllerToInt.KeyboardCommandInt,
	b:KeyboardControllerToInt.KeyboardCommandInt,
	select:KeyboardControllerToInt.KeyboardCommandInt,
	start:KeyboardControllerToInt.KeyboardCommandInt):
	override_all_nes_buttons(int(left), int(right), int(up), int(down), int(a), int(b), int(select), int(start))

#region OVERRIDE NES PAD TO INT
func set_button_b_to_x():
	get_nes().override_b_as_xbox_x()

func set_button_b_to_b():
	get_nes().override_b_as_xbox_b()

func set_button_b_to_y():
	get_nes().override_b_as_xbox_y()

func set_arrows_to_default_dpad():
	get_nes().reset_arrows_to_default()

func set_arrows_to_left_joystick():
	get_nes().override_arrows_with_joystick_left()

func set_arrows_to_right_joystick():
	get_nes().override_arrows_with_joystick_right()

func set_arrows_to_mixed_joystick_vertical_left_horizontal_right():
	get_nes().override_arrows_with_stick_left_vertical_stick_right_horizontal()
#endregion



#region NES BASIC ACCESS 

func nes_basic_press_a():
	get_nes().press_key_with_enum(NesControllerToInt.NesButton.BUTTON_A)
func nes_basic_press_b():
	get_nes().press_key_with_enum(NesControllerToInt.NesButton.BUTTON_B)
func nes_basic_press_menu_left_select():
	get_nes().press_key_with_enum(NesControllerToInt.NesButton.MENU_LEFT)
func nes_basic_press_menu_right_start():
	get_nes().press_key_with_enum(NesControllerToInt.NesButton.MENU_RIGHT)	
func nes_basic_press_arrow_left():
	get_nes().press_key_with_enum(NesControllerToInt.NesButton.ARROW_LEFT)
func nes_basic_press_arrow_right():
	get_nes().press_key_with_enum(NesControllerToInt.NesButton.ARROW_RIGHT)
func nes_basic_press_arrow_up():
	get_nes().press_key_with_enum(NesControllerToInt.NesButton.ARROW_UP)
func nes_basic_press_arrow_down():
	get_nes().press_key_with_enum(NesControllerToInt.NesButton.ARROW_DOWN)

func nes_basic_release_a():
	get_nes().release_key_with_enum(NesControllerToInt.NesButton.BUTTON_A)
func nes_basic_release_b():
	get_nes().release_key_with_enum(NesControllerToInt.NesButton.BUTTON_B)
func nes_basic_release_menu_left_select():
	get_nes().release_key_with_enum(NesControllerToInt.NesButton.MENU_LEFT)
func nes_basic_release_menu_right_start():
	get_nes().release_key_with_enum(NesControllerToInt.NesButton.MENU_RIGHT)
func nes_basic_release_arrow_left():
	get_nes().release_key_with_enum(NesControllerToInt.NesButton.ARROW_LEFT)
func nes_basic_release_arrow_right():
	get_nes().release_key_with_enum(NesControllerToInt.NesButton.ARROW_RIGHT)
func nes_basic_release_arrow_up():
	get_nes().release_key_with_enum(NesControllerToInt.NesButton.ARROW_UP)
func nes_basic_release_arrow_down():
	get_nes().release_key_with_enum(NesControllerToInt.NesButton.ARROW_DOWN)


func nes_basic_set_a(press_value:bool):
	get_nes().set_down_up_key_with_enum(NesControllerToInt.NesButton.BUTTON_A, press_value)
func nes_basic_set_b(press_value:bool):
	get_nes().set_down_up_key_with_enum(NesControllerToInt.NesButton.BUTTON_B, press_value)
func nes_basic_set_menu_left_select(press_value:bool):
	get_nes().set_down_up_key_with_enum(NesControllerToInt.NesButton.MENU_LEFT, press_value)
func nes_basic_set_menu_right_start(press_value:bool):
	get_nes().set_down_up_key_with_enum(NesControllerToInt.NesButton.MENU_RIGHT, press_value)
func nes_basic_set_arrow_left(press_value:bool):
	get_nes().set_down_up_key_with_enum(NesControllerToInt.NesButton.ARROW_LEFT, press_value)
func nes_basic_set_arrow_right(press_value:bool):
	get_nes().set_down_up_key_with_enum(NesControllerToInt.NesButton.ARROW_RIGHT, press_value)
func nes_basic_set_arrow_up(press_value:bool):
	get_nes().set_down_up_key_with_enum(NesControllerToInt.NesButton.ARROW_UP, press_value)
func nes_basic_set_arrow_down(press_value:bool):
	get_nes().set_down_up_key_with_enum(NesControllerToInt.NesButton.ARROW_DOWN, press_value)


func nes_basic_press_a_in_milliseconds(milliseconds_delay:int):
	get_nes().press_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.BUTTON_A, milliseconds_delay)
func nes_basic_press_b_in_milliseconds(milliseconds_delay:int):
	get_nes().press_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.BUTTON_B, milliseconds_delay)
func nes_basic_press_menu_left_in_milliseconds(milliseconds_delay:int):
	get_nes().press_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.MENU_LEFT, milliseconds_delay)
func nes_basic_press_menu_right_in_milliseconds(milliseconds_delay:int):
	get_nes().press_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.MENU_RIGHT, milliseconds_delay)
func nes_basic_press_arrow_left_in_milliseconds(milliseconds_delay:int):
	get_nes().press_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.ARROW_LEFT, milliseconds_delay)
func nes_basic_press_arrow_right_in_milliseconds(milliseconds_delay:int):
	get_nes().press_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.ARROW_RIGHT, milliseconds_delay)
func nes_basic_press_arrow_up_in_milliseconds(milliseconds_delay:int):
	get_nes().press_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.ARROW_UP, milliseconds_delay)
func nes_basic_press_arrow_down_in_milliseconds(milliseconds_delay:int):
	get_nes().press_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.ARROW_DOWN, milliseconds_delay)
	

func nes_basic_release_a_in_milliseconds(milliseconds_delay:int):
	get_nes().release_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.BUTTON_A, milliseconds_delay)
func nes_basic_release_b_in_milliseconds(milliseconds_delay:int):
	get_nes().release_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.BUTTON_B, milliseconds_delay)
func nes_basic_release_menu_left_in_milliseconds(milliseconds_delay:int):
	get_nes().release_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.MENU_LEFT, milliseconds_delay)
func nes_basic_release_menu_right_in_milliseconds(milliseconds_delay:int):
	get_nes().release_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.MENU_RIGHT, milliseconds_delay)
func nes_basic_release_arrow_left_in_milliseconds(milliseconds_delay:int):
	get_nes().release_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.ARROW_LEFT, milliseconds_delay)
func nes_basic_release_arrow_right_in_milliseconds(milliseconds_delay:int):
	get_nes().release_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.ARROW_RIGHT, milliseconds_delay)
func nes_basic_release_arrow_up_in_milliseconds(milliseconds_delay:int):
	get_nes().release_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.ARROW_UP, milliseconds_delay)
func nes_basic_release_arrow_down_in_milliseconds(milliseconds_delay:int):
	get_nes().release_key_with_enum_in_milliseconds(NesControllerToInt.NesButton.ARROW_DOWN, milliseconds_delay)

#endregion
