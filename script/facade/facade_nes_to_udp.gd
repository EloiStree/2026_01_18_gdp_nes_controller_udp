class_name FacadeNesToUdp
extends Node

signal on_send_int_to_target(new_value:int)

@export_group("Main Component")
@export var _udp_sender: NesSendIntegerMessageUdp
@export var _nes_pad: NesControllerToInt
@export var _int_delayer: NesIntDelayer
@export var _xbox: XboxControllerToInt

@export_group("Save and Load")
@export var _use_save_and_load:bool =true
@export var _memory_ip_address: NesSaveLoadStringValueFromFileMemory
@export var _memory_port: NesSaveLoadStringValueFromFileMemory
@export var _memory_player_index: NesSaveLoadStringValueFromFileMemory



@export_group("For Debugging")
@export var last_sent_int_to_target:int
@export var target_ipv4:String
@export var target_port:int
@export var target_index:int
@export var waiting_command_in_queue:int

func _update_last_sent_int_to_target(new_value:int):
	last_sent_int_to_target = new_value
	on_send_int_to_target.emit(new_value)

func _ready() -> void:
	if _udp_sender != null:
		_udp_sender.on_integer_sent.connect(_update_last_sent_int_to_target)

	if _use_save_and_load:
		if _memory_ip_address != null:
			set_target_ipv4(_memory_ip_address.load_text())
		if _memory_port != null:
			set_target_port(_memory_port.load_text())
		if _memory_player_index != null:
			set_target_index(_memory_player_index.load_text())

func _process(delta: float) -> void:
	target_ipv4 = _udp_sender.ipv4_to_target
	target_port = _udp_sender.port_to_target
	target_index = _udp_sender.player_to_target
	waiting_command_in_queue = _int_delayer.get_waiting_command_in_queue()

func _exit_tree() -> void:
	if _use_save_and_load:
		if _memory_ip_address != null:
			_memory_ip_address.save_given_text(get_target_ipv4())
		if _memory_port != null:
			_memory_port.save_given_text(str(get_target_port()))
		if _memory_player_index != null:
			_memory_player_index.save_given_text(str(get_target_index()))

	
#region GET MAIN COMPONENTS
func get_nes()-> NesControllerToInt:
	return _nes_pad
func get_udp_sender()-> NesSendIntegerMessageUdp:
	return _udp_sender

func get_int_delayer()-> NesIntDelayer:
	return _int_delayer
	
func get_xbox()->XboxControllerToInt:
	return _xbox
#endregion

#region UDP SENDER ACCESS

func set_target_ipv4(new_ipv4:String):
	get_udp_sender().set_target_ipv4(new_ipv4)
	if _use_save_and_load and _memory_ip_address != null:
		_memory_ip_address.save_given_text(new_ipv4)

func set_target_port(new_port:String):
	get_udp_sender().set_target_port(new_port)
	if _use_save_and_load and _memory_port != null:
		_memory_port.save_given_text(new_port)

func set_target_index(new_index:String):
	get_udp_sender().set_target_player_index(new_index)
	if _use_save_and_load and _memory_player_index != null:
		_memory_player_index.save_given_text(new_index)


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
func send_custom_index_integer_to_target(new_value:int, target_index:int):
	get_udp_sender().send_index_integer_to_target(target_index, new_value)
#endregion

#region NES ACCESS
func get_key_value_from_enum(key_enum:NesControllerToInt.NesButton) -> int:
	return get_nes().get_key_value_from_enum(key_enum)
func press_key_with_enum(key_enum:NesControllerToInt.NesButton, press_type:NesControllerToInt.PressType):
	return get_nes().press_key_with_enum(key_enum, press_type)
func press_key_with_enum_in_milliseconds(key_enum:NesControllerToInt.NesButton, delay_milliseconds:int):
	return get_nes().press_key_with_enum_in_milliseconds(key_enum, delay_milliseconds)
func release_key_with_enum_in_milliseconds(key_enum:NesControllerToInt.NesButton, delay_milliseconds:int):
	return get_nes().release_key_with_enum_in_milliseconds(key_enum, delay_milliseconds)
func press_key_with_enum_in_seconds(key_enum:NesControllerToInt.NesButton, delay_seconds:float):
	return get_nes().press_key_with_enum_in_seconds(key_enum, delay_seconds)
func release_key_with_enum_in_seconds(key_enum:NesControllerToInt.NesButton, delay_seconds:float):
	return get_nes().release_key_with_enum_in_seconds(key_enum, delay_seconds)
func stroke_key_with_enum_for_milliseconds(key_enum:NesControllerToInt.NesButton, press_duration_milliseconds:int):
	return get_nes().stroke_key_with_enum_for_milliseconds(key_enum, press_duration_milliseconds)
func stroke_key_with_enum_for_seconds(key_enum:NesControllerToInt.NesButton, press_duration_seconds:float):
	return get_nes().stroke_key_with_enum_for_seconds(key_enum, press_duration_seconds)
func stroke_key_with_enum_in_milliseconds(key_enum:NesControllerToInt.NesButton, delay_milliseconds:int, press_duration_milliseconds:int):
	return get_nes().stroke_key_with_enum_in_milliseconds(key_enum, delay_milliseconds, press_duration_milliseconds)
func stroke_key_with_enum_in_seconds(key_enum:NesControllerToInt.NesButton, delay_seconds:float, press_duration_seconds:float):
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
