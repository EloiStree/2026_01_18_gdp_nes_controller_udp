class_name FacadeNesToUdp
extends Node

signal on_send_int_to_target(new_value:int)

@export_group("Main Component")
@export var udp_sender: NesSendIntegerMessageUdp
@export var nes_pad: NesControllerToInt
@export var int_delayer: NesIntDelayer
@export var xbox: XboxControllerToInt
@export var keyboard: KeyboardControllerToInt
@export var interpreter: NesMacroInterpreterToInt
	
@export var target_at_init:NesResTargetPlayerByUdp

@export var override_nes_integer_at_ready:NesableGameMappingAbstractGet

@export_group("For Debugging (Do not touch)")
@export var last_sent_int_to_target:int
@export var target_ipv4:String
@export var target_port:int
@export var target_index:int
@export var waiting_command_in_queue:int


# 🕹️A 🕹️B 🕹️AL 🕹️AR 🕹️AD 🕹️AU 🕹️ML 🕹️MD 
# 🎮A 🎮B 🎮Y 🎮X
# 🎮ML 🎮MC 🎮MR  
# 🎮AL 🎮AR 🎮AD 🎮AU
# 🎮SBL 🎮SBL 🎮TL 🎮TR
# 🎮AL 🎮AR 🎮AD 🎮AU 
# 🎮JL 🎮JR 
# 🎮JLU 🎮JLR 🎮JLD 🎮JLL
# 🎮JRU 🎮JRR 🎮JRD 🎮JRL
# ⌨️A ⌨️B ⌨️C ⌨️D ⌨️E ⌨️F ⌨️G ⌨️H ⌨️I ⌨️J ⌨️K ⌨️L ⌨️M ⌨️N ⌨️O ⌨️P ⌨️Q ⌨️R ⌨️S ⌨️T ⌨️U ⌨️V ⌨️W ⌨️X ⌨️Y ⌨️Z
# ⌨️0 ⌨️1 ⌨️2 ⌨️3 ⌨️4 ⌨️5 ⌨️6 ⌨️7 ⌨️8 ⌨️9
# ⌨️F1 ⌨️F2 ⌨️F3 ⌨️F4 ⌨️F5 ⌨️F6 ⌨️F7 ⌨️F8 ⌨️F9 ⌨️F10 ⌨️F11 ⌨️F12
# ⌨️ESC ⌨️TAB ⌨️CAPS ⌨️LSHIFT ⌨️LCTRL ⌨️LALT ⌨️SPACE ⌨️RALT ⌨️RCTRL ⌨️RSHIFT ⌨️ENTER ⌨️BACKSPACE ⌨️INS ⌨️DEL ⌨️HOME ⌨️END ⌨️PGUP ⌨️PGDN
# ⌨️MINUS  ⌨️EQUAL ⌨️DIVIDE ⌨️MULTIPLY 
# ⌨️LEFT ⌨️RIGHT ⌨️UP ⌨️DOWN ⌨️AL ⌨️AR ⌨️AU ⌨️AD

# macro  🕹️A+ 2000> 🕹️A- 2000> ⌨️A+  2000> ⌨️A- 2000>  🎮A+ 2000> 🎮A-


@export var add_xbox_unicode_macro:bool=true
@export var add_nes_unicode_macro:bool=true
@export var add_keyboard_unicode_macro:bool=true


func _add_nes_value_to_interpreter(word:String, nes:NesControllerToInt.NesButton):
		interpreter_add_word_to_key_press_integer_macro(word, int(nes))

func _add_xbox_value_to_interpreter(word:String, xbox_enum:XboxControllerToInt.XboxCommandBasic):
		interpreter_add_word_to_key_press_integer_macro(word, xbox_get_key_value_from_enum(xbox_enum))

func _add_keyboard_value_to_interpreter(word:String, keyboard_enum:KeyboardControllerToInt.KeyboardCommandInt):
		interpreter_add_word_to_key_press_integer_macro(word, keyboard_get_key_value_from_enum(keyboard_enum))

# 🎮A 🕹️A ⌨️A
func _add_joystick_and_nes_default_macro():
	if add_nes_unicode_macro:
		_add_nes_value_to_interpreter("🕹️A", NesControllerToInt.NesButton.BUTTON_A)
		_add_nes_value_to_interpreter("🕹️B", NesControllerToInt.NesButton.BUTTON_B)
		_add_nes_value_to_interpreter("🕹️ML", NesControllerToInt.NesButton.MENU_LEFT)
		_add_nes_value_to_interpreter("🕹️MR", NesControllerToInt.NesButton.MENU_RIGHT)
		_add_nes_value_to_interpreter("🕹️AD", NesControllerToInt.NesButton.ARROW_DOWN)
		_add_nes_value_to_interpreter("🕹️AU", NesControllerToInt.NesButton.ARROW_UP)
		_add_nes_value_to_interpreter("🕹️AL", NesControllerToInt.NesButton.ARROW_LEFT)
		_add_nes_value_to_interpreter("🕹️AR", NesControllerToInt.NesButton.ARROW_RIGHT)



	if add_xbox_unicode_macro:
		_add_xbox_value_to_interpreter("🎮A", XboxControllerToInt.XboxCommandBasic.BUTTON_DOWN_A)
		_add_xbox_value_to_interpreter("🎮B", XboxControllerToInt.XboxCommandBasic.BUTTON_RIGHT_B)
		_add_xbox_value_to_interpreter("🎮X", XboxControllerToInt.XboxCommandBasic.BUTTON_LEFT_X)
		_add_xbox_value_to_interpreter("🎮Y", XboxControllerToInt.XboxCommandBasic.BUTTON_UP_Y)
		_add_xbox_value_to_interpreter("🎮ML",XboxControllerToInt.XboxCommandBasic.BUTTON_MENU_LEFT)
		_add_xbox_value_to_interpreter("🎮MR",XboxControllerToInt.XboxCommandBasic.BUTTON_MENU_RIGHT)
		_add_xbox_value_to_interpreter("🎮MC",XboxControllerToInt.XboxCommandBasic.XBOX_HOME_BUTTON)		
		_add_xbox_value_to_interpreter("🎮AL",XboxControllerToInt.XboxCommandBasic.ARROW_LEFT)
		_add_xbox_value_to_interpreter("🎮AR",XboxControllerToInt.XboxCommandBasic.ARROW_RIGHT)
		_add_xbox_value_to_interpreter("🎮AD",XboxControllerToInt.XboxCommandBasic.ARROW_DOWN)
		_add_xbox_value_to_interpreter("🎮AU",XboxControllerToInt.XboxCommandBasic.ARROW_UP)
		_add_xbox_value_to_interpreter("🎮TL",XboxControllerToInt.XboxCommandBasic.LEFT_TRIGGER_100)
		_add_xbox_value_to_interpreter("🎮TR",XboxControllerToInt.XboxCommandBasic.RIGHT_TRIGGER_100)
		_add_xbox_value_to_interpreter("🎮SBL",XboxControllerToInt.XboxCommandBasic.BUTTON_LEFT_SIDE)
		_add_xbox_value_to_interpreter("🎮SBR",XboxControllerToInt.XboxCommandBasic.BUTTON_RIGHT_SIDE)
		_add_xbox_value_to_interpreter("🎮JL",XboxControllerToInt.XboxCommandBasic.BUTTON_LEFT_STICK)
		_add_xbox_value_to_interpreter("🎮JR",XboxControllerToInt.XboxCommandBasic.BUTTON_RIGHT_STICK)
		_add_xbox_value_to_interpreter("🎮JLU",XboxControllerToInt.XboxCommandBasic.LEFT_STICK_VERTICAL_P100)
		_add_xbox_value_to_interpreter("🎮JLR",XboxControllerToInt.XboxCommandBasic.LEFT_STICK_HORIZONTAL_P100)
		_add_xbox_value_to_interpreter("🎮JLD",XboxControllerToInt.XboxCommandBasic.LEFT_STICK_VERTICAL_N100)
		_add_xbox_value_to_interpreter("🎮JLL",XboxControllerToInt.XboxCommandBasic.LEFT_STICK_HORIZONTAL_N100)
		_add_xbox_value_to_interpreter("🎮JRU",XboxControllerToInt.XboxCommandBasic.RIGHT_STICK_VERTICAL_P100)
		_add_xbox_value_to_interpreter("🎮JRR",XboxControllerToInt.XboxCommandBasic.RIGHT_STICK_HORIZONTAL_P100)
		_add_xbox_value_to_interpreter("🎮JRD",XboxControllerToInt.XboxCommandBasic.RIGHT_STICK_VERTICAL_N100)
		_add_xbox_value_to_interpreter("🎮JRL",XboxControllerToInt.XboxCommandBasic.RIGHT_STICK_HORIZONTAL_N100)
	if add_keyboard_unicode_macro:
		# # ⌨️A ⌨️B ⌨️C ⌨️D ⌨️E ⌨️F ⌨️G ⌨️H ⌨️I ⌨️J ⌨️K ⌨️L ⌨️M ⌨️N ⌨️O ⌨️P ⌨️Q ⌨️R ⌨️S ⌨️T ⌨️U ⌨️V ⌨️W ⌨️X ⌨️Y ⌨️Z
		# # ⌨️0 ⌨️1 ⌨️2 ⌨️3 ⌨️4 ⌨️5 ⌨️6 ⌨️7 ⌨️8 ⌨️9
		# # ⌨️F1 ⌨️F2 ⌨️F3 ⌨️F4 ⌨️F5 ⌨️F6 ⌨️F7 ⌨️F8 ⌨️F9 ⌨️F10 ⌨️F11 ⌨️F12
		# # ⌨️ESC ⌨️TAB ⌨️CAPS ⌨️LSHIFT ⌨️LCTRL ⌨️LALT ⌨️SPACE ⌨️RALT ⌨️RCTRL ⌨️RSHIFT ⌨️ENTER ⌨️BACKSPACE ⌨️INS ⌨️DEL ⌨️HOME ⌨️END ⌨️PGUP ⌨️PGDN
		# # ⌨️MINUS  ⌨️EQUAL ⌨️DIVIDE ⌨️MULTIPLY 
		# # ⌨️LEFT ⌨️RIGHT ⌨️UP ⌨️DOWN ⌨️AL ⌨️AR ⌨️AU ⌨️AD

		_add_keyboard_value_to_interpreter("⌨️A", KeyboardControllerToInt.KeyboardCommandInt.A)
		_add_keyboard_value_to_interpreter("⌨️B", KeyboardControllerToInt.KeyboardCommandInt.B)
		_add_keyboard_value_to_interpreter("⌨️C", KeyboardControllerToInt.KeyboardCommandInt.C)
		_add_keyboard_value_to_interpreter("⌨️D", KeyboardControllerToInt.KeyboardCommandInt.D)
		_add_keyboard_value_to_interpreter("⌨️E", KeyboardControllerToInt.KeyboardCommandInt.E)
		_add_keyboard_value_to_interpreter("⌨️F", KeyboardControllerToInt.KeyboardCommandInt.F)
		_add_keyboard_value_to_interpreter("⌨️G", KeyboardControllerToInt.KeyboardCommandInt.G)
		_add_keyboard_value_to_interpreter("⌨️H", KeyboardControllerToInt.KeyboardCommandInt.H)
		_add_keyboard_value_to_interpreter("⌨️I", KeyboardControllerToInt.KeyboardCommandInt.I)
		_add_keyboard_value_to_interpreter("⌨️J", KeyboardControllerToInt.KeyboardCommandInt.J)
		_add_keyboard_value_to_interpreter("⌨️K", KeyboardControllerToInt.KeyboardCommandInt.K)
		_add_keyboard_value_to_interpreter("⌨️L", KeyboardControllerToInt.KeyboardCommandInt.L)
		_add_keyboard_value_to_interpreter("⌨️M", KeyboardControllerToInt.KeyboardCommandInt.M)
		_add_keyboard_value_to_interpreter("⌨️N", KeyboardControllerToInt.KeyboardCommandInt.N)
		_add_keyboard_value_to_interpreter("⌨️O", KeyboardControllerToInt.KeyboardCommandInt.O)
		_add_keyboard_value_to_interpreter("⌨️P", KeyboardControllerToInt.KeyboardCommandInt.P)
		_add_keyboard_value_to_interpreter("⌨️Q", KeyboardControllerToInt.KeyboardCommandInt.Q)
		_add_keyboard_value_to_interpreter("⌨️R", KeyboardControllerToInt.KeyboardCommandInt.R)
		_add_keyboard_value_to_interpreter("⌨️S", KeyboardControllerToInt.KeyboardCommandInt.S)
		_add_keyboard_value_to_interpreter("⌨️T", KeyboardControllerToInt.KeyboardCommandInt.T)
		_add_keyboard_value_to_interpreter("⌨️U", KeyboardControllerToInt.KeyboardCommandInt.U)
		_add_keyboard_value_to_interpreter("⌨️V", KeyboardControllerToInt.KeyboardCommandInt.V)
		_add_keyboard_value_to_interpreter("⌨️W", KeyboardControllerToInt.KeyboardCommandInt.W)
		_add_keyboard_value_to_interpreter("⌨️X", KeyboardControllerToInt.KeyboardCommandInt.X)
		_add_keyboard_value_to_interpreter("⌨️Y", KeyboardControllerToInt.KeyboardCommandInt.Y)
		_add_keyboard_value_to_interpreter("⌨️Z", KeyboardControllerToInt.KeyboardCommandInt.Z)
		_add_keyboard_value_to_interpreter("⌨️0", KeyboardControllerToInt.KeyboardCommandInt.Alpha0)
		_add_keyboard_value_to_interpreter("⌨️1", KeyboardControllerToInt.KeyboardCommandInt.Alpha1)
		_add_keyboard_value_to_interpreter("⌨️2", KeyboardControllerToInt.KeyboardCommandInt.Alpha2)
		_add_keyboard_value_to_interpreter("⌨️3", KeyboardControllerToInt.KeyboardCommandInt.Alpha3)
		_add_keyboard_value_to_interpreter("⌨️4", KeyboardControllerToInt.KeyboardCommandInt.Alpha4)
		_add_keyboard_value_to_interpreter("⌨️5", KeyboardControllerToInt.KeyboardCommandInt.Alpha5)
		_add_keyboard_value_to_interpreter("⌨️6", KeyboardControllerToInt.KeyboardCommandInt.Alpha6)
		_add_keyboard_value_to_interpreter("⌨️7", KeyboardControllerToInt.KeyboardCommandInt.Alpha7)
		_add_keyboard_value_to_interpreter("⌨️8", KeyboardControllerToInt.KeyboardCommandInt.Alpha8)
		_add_keyboard_value_to_interpreter("⌨️9", KeyboardControllerToInt.KeyboardCommandInt.Alpha9)
		_add_keyboard_value_to_interpreter("⌨️F1", KeyboardControllerToInt.KeyboardCommandInt.F1)
		_add_keyboard_value_to_interpreter("⌨️F2", KeyboardControllerToInt.KeyboardCommandInt.F2)
		_add_keyboard_value_to_interpreter("⌨️F3", KeyboardControllerToInt.KeyboardCommandInt.F3)
		_add_keyboard_value_to_interpreter("⌨️F4", KeyboardControllerToInt.KeyboardCommandInt.F4)
		_add_keyboard_value_to_interpreter("⌨️F5", KeyboardControllerToInt.KeyboardCommandInt.F5)
		_add_keyboard_value_to_interpreter("⌨️F6", KeyboardControllerToInt.KeyboardCommandInt.F6)
		_add_keyboard_value_to_interpreter("⌨️F7", KeyboardControllerToInt.KeyboardCommandInt.F7)
		_add_keyboard_value_to_interpreter("⌨️F8", KeyboardControllerToInt.KeyboardCommandInt.F8)
		_add_keyboard_value_to_interpreter("⌨️F9", KeyboardControllerToInt.KeyboardCommandInt.F9)
		_add_keyboard_value_to_interpreter("⌨️F10", KeyboardControllerToInt.KeyboardCommandInt.F10)
		_add_keyboard_value_to_interpreter("⌨️F11", KeyboardControllerToInt.KeyboardCommandInt.F11)
		_add_keyboard_value_to_interpreter("⌨️F12", KeyboardControllerToInt.KeyboardCommandInt.F12)
		_add_keyboard_value_to_interpreter("⌨️ESC", KeyboardControllerToInt.KeyboardCommandInt.Escape)
		_add_keyboard_value_to_interpreter("⌨️TAB", KeyboardControllerToInt.KeyboardCommandInt.Tab)
		_add_keyboard_value_to_interpreter("⌨️CAPS", KeyboardControllerToInt.KeyboardCommandInt.CapsLock)
		_add_keyboard_value_to_interpreter("⌨️LSHIFT", KeyboardControllerToInt.KeyboardCommandInt.LeftShift)
		_add_keyboard_value_to_interpreter("⌨️LCTRL", KeyboardControllerToInt.KeyboardCommandInt.LeftControl)
		_add_keyboard_value_to_interpreter("⌨️LALT", KeyboardControllerToInt.KeyboardCommandInt.LeftAlt)
		_add_keyboard_value_to_interpreter("⌨️SPACE", KeyboardControllerToInt.KeyboardCommandInt.Space)
		_add_keyboard_value_to_interpreter("⌨️RALT", KeyboardControllerToInt.KeyboardCommandInt.RightAlt)
		_add_keyboard_value_to_interpreter("⌨️RCTRL", KeyboardControllerToInt.KeyboardCommandInt.RightControl)
		_add_keyboard_value_to_interpreter("⌨️RSHIFT", KeyboardControllerToInt.KeyboardCommandInt.RightShift)
		_add_keyboard_value_to_interpreter("⌨️ENTER", KeyboardControllerToInt.KeyboardCommandInt.Enter)
		_add_keyboard_value_to_interpreter("⌨️BACKSPACE", KeyboardControllerToInt.KeyboardCommandInt.Backspace)
		_add_keyboard_value_to_interpreter("⌨️INS", KeyboardControllerToInt.KeyboardCommandInt.Insert)
		_add_keyboard_value_to_interpreter("⌨️DEL", KeyboardControllerToInt.KeyboardCommandInt.Delete)
		_add_keyboard_value_to_interpreter("⌨️HOME", KeyboardControllerToInt.KeyboardCommandInt.Home)
		_add_keyboard_value_to_interpreter("⌨️END", KeyboardControllerToInt.KeyboardCommandInt.End)
		_add_keyboard_value_to_interpreter("⌨️PGUP", KeyboardControllerToInt.KeyboardCommandInt.PageUp)
		_add_keyboard_value_to_interpreter("⌨️PGDN", KeyboardControllerToInt.KeyboardCommandInt.PageDown)
		_add_keyboard_value_to_interpreter("⌨️MINUS", KeyboardControllerToInt.KeyboardCommandInt.NumpadSubtract)
		_add_keyboard_value_to_interpreter("⌨️DIVIDE", KeyboardControllerToInt.KeyboardCommandInt.NumpadDivide)
		_add_keyboard_value_to_interpreter("⌨️MULTIPLY", KeyboardControllerToInt.KeyboardCommandInt.NumpadMultiply)
		_add_keyboard_value_to_interpreter("⌨️LEFT", KeyboardControllerToInt.KeyboardCommandInt.Left)
		_add_keyboard_value_to_interpreter("⌨️RIGHT", KeyboardControllerToInt.KeyboardCommandInt.Right)
		_add_keyboard_value_to_interpreter("⌨️UP", KeyboardControllerToInt.KeyboardCommandInt.Up)
		_add_keyboard_value_to_interpreter("⌨️AD", KeyboardControllerToInt.KeyboardCommandInt.Down)
		_add_keyboard_value_to_interpreter("⌨️AL", KeyboardControllerToInt.KeyboardCommandInt.Left)
		_add_keyboard_value_to_interpreter("⌨️AR", KeyboardControllerToInt.KeyboardCommandInt.Right)
		_add_keyboard_value_to_interpreter("⌨️AU", KeyboardControllerToInt.KeyboardCommandInt.Up)
		

func _update_last_sent_int_to_target(new_value:int):
	last_sent_int_to_target = new_value
	on_send_int_to_target.emit(new_value)

func _send_integer_to_udp_target(new_value:int):
	get_udp_sender().send_integer(new_value)

func _append_integer_with_delay_to_udp_target(new_value:int, delay_milliseconds:int):
	get_int_delayer().add_action_to_delay_as_integer_in_milliseconds(new_value, delay_milliseconds)

func _init() -> void:
	if target_at_init != null:
		udp_sender.set_target_ipv4(target_at_init.target_ip)
		udp_sender.set_target_port(target_at_init.target_port)
		udp_sender.set_target_player_index(target_at_init.target_player_index)
		print("Target set at init: " + target_at_init.target_ip + ":" + str(target_at_init.target_port) + " player index: " + str(target_at_init.target_player_index))


@export var auto_connect_signal_to_udp := true

func _ready() -> void:
	_add_joystick_and_nes_default_macro()

	if udp_sender != null:
		udp_sender.on_integer_sent.connect(_update_last_sent_int_to_target)
	
	if auto_connect_signal_to_udp:
		if int_delayer != null:
			int_delayer.on_action_integer_requested.connect(_send_integer_to_udp_target)
		
		if interpreter != null:
			interpreter.on_integer_to_send_requested.connect(_send_integer_to_udp_target)
			interpreter.on_integer_to_send_requested_with_milliseconds_delay.connect(_append_integer_with_delay_to_udp_target)
		if nes_pad != null:
			nes_pad.on_integer_to_send_requested.connect(_send_integer_to_udp_target)
			nes_pad.on_integer_to_send_requested_with_milliseconds_delay.connect(_append_integer_with_delay_to_udp_target)
		if xbox != null:
			xbox.on_integer_to_send_requested.connect(_send_integer_to_udp_target)
			xbox.on_integer_with_millisecond_delay_to_send_requested.connect(_append_integer_with_delay_to_udp_target)
		if keyboard != null:
			keyboard.on_integer_to_send_requested.connect(_send_integer_to_udp_target)
			keyboard.on_integer_with_millisecond_delay_to_send_requested.connect(_append_integer_with_delay_to_udp_target)
			
	if override_nes_integer_at_ready!=null:
		get_nes().override_buttons_with_abstract_resource_int(override_nes_integer_at_ready)




func _process(delta: float) -> void:
	target_ipv4 = udp_sender.ipv4_to_target
	target_port = udp_sender.port_to_target
	target_index = udp_sender.player_to_target
	waiting_command_in_queue = int_delayer.get_waiting_command_in_queue()





#region MACRO INTERPRETOR

func interpreter_translate_text_macro_to_int_and_callable(text:String):
	
	interpreter.translate_text_to_integer_and_callable(text)
	
func interpreter_clear_all_words(word_name:String, callback:Callable):
	interpreter.clear_all_words()

func interpreter_add_callable_macro(word_name:String, callback:Callable):
	interpreter.add_callable_by_key_name(word_name, callback)
	
func interpreter_add_word_to_integer_macro(word_name:String, value:int):
	interpreter.add_integer_by_key_name(word_name, value)
	
func interpreter_add_word_to_key_press_integer_macro(word_name:String, key_press:int):
	interpreter.add_press_release_integer_by_key_name(word_name, key_press)

#endregion


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

func get_interpreter()->NesMacroInterpreterToInt:
	return interpreter

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


#region OVERRIDE NES TOUCH

func _parse_text_to_integer(text:String, error_value:int=0)->int:
	var parsed_value = int(text)
	if parsed_value == null:
		return error_value
	return int(text)
	

func nes_override_button_a_from_int_text(integer_as_text):
	get_nes().override_button_a_from_int_text(integer_as_text)
func nes_override_button_b_from_int_text(integer_as_text):
	get_nes().override_button_b_from_int_text(integer_as_text)

func nes_override_menu_left_from_int_text(integer_as_text):
	get_nes().override_menu_left_from_int_text(integer_as_text)
	
func nes_override_menu_right_from_int_text(integer_as_text):
	get_nes().override_menu_right_from_int_text(integer_as_text)
	
func nes_override_arrow_up_from_int_text(integer_as_text):
	get_nes().override_arrow_up_from_int_text(integer_as_text)
func nes_override_arrow_down_from_int_text(integer_as_text):
	get_nes().override_arrow_down_from_int_text(integer_as_text)
func nes_override_arrow_left_from_int_text(integer_as_text):
	get_nes().override_arrow_left_from_int_text(integer_as_text)
func nes_override_arrow_right_from_int_text(integer_as_text):
	get_nes().override_arrow_right_from_int_text(integer_as_text)

func nes_override_buttons_with_resource_int(resource:Resource):
	get_nes().override_buttons_with_resource_int(resource)
func nes_override_buttons_with_resource_keyboard(resource:Resource):
	get_nes().override_buttons_with_resource_keyboard(resource)
func nes_override_buttons_with_resource_xbox(resource:Resource):
	get_nes().override_buttons_with_resource_xbox(resource)


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
	return get_keyboard().get_key_int_value_from_enum(key_enum)

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

func override_all_nes_buttons_from_text(gauche:String, droite:String, haut:String, bas:String, a:String, b:String, select:String, start:String):
	get_nes().override_all_buttons_from_text(gauche, droite, haut, bas, a, b, select, start)

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


#region GET BUTTONS

func get_nes_button_arrow_up_as_int()->int:
	return get_nes().get_nes_button_arrow_up_as_int()

func get_nes_button_arrow_right_as_int()->int:
	return get_nes().get_nes_button_arrow_right_as_int()

func get_nes_button_arrow_down_as_int()->int:
	return get_nes().get_nes_button_arrow_down_as_int()

func get_nes_button_arrow_left_as_int()->int:
	return get_nes().get_nes_button_arrow_left_as_int()

func get_nes_button_a_as_int()->int:
	return get_nes().get_nes_button_a_as_int()

func get_nes_button_b_as_int()->int:
	return get_nes().get_nes_button_b_as_int()

func get_nes_button_menu_left_as_int()->int:
	return get_nes().get_nes_button_menu_left_as_int()

func get_nes_button_menu_right_as_int()->int:
	return get_nes().get_nes_button_menu_right_as_int()

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


#region PLAY NES AS

func play_nes_as_keyboard_10_seconds_ninja():
	override_all_nes_buttons_with_keyboard(
		KeyboardControllerToInt.KeyboardCommandInt.Left,
		KeyboardControllerToInt.KeyboardCommandInt.Right,
		KeyboardControllerToInt.KeyboardCommandInt.Up,
		KeyboardControllerToInt.KeyboardCommandInt.Down,
		KeyboardControllerToInt.KeyboardCommandInt.Z,
		KeyboardControllerToInt.KeyboardCommandInt.X,
		KeyboardControllerToInt.KeyboardCommandInt.Escape,
		KeyboardControllerToInt.KeyboardCommandInt.R
	)

func play_nes_as_xbox_10_seconds_ninja():
	override_all_nes_buttons_with_xbox(
		XboxControllerToInt.XboxCommandBasic.ARROW_LEFT,
		XboxControllerToInt.XboxCommandBasic.ARROW_RIGHT,
		XboxControllerToInt.XboxCommandBasic.ARROW_UP,
		XboxControllerToInt.XboxCommandBasic.ARROW_DOWN,
		XboxControllerToInt.XboxCommandBasic.BUTTON_DOWN_A,
		XboxControllerToInt.XboxCommandBasic.BUTTON_RIGHT_B,
		XboxControllerToInt.XboxCommandBasic.BUTTON_MENU_LEFT,
		XboxControllerToInt.XboxCommandBasic.BUTTON_MENU_RIGHT
	)	

func play_nes_as_xbox_stealth_bastard():
	override_all_nes_buttons_with_xbox(
		XboxControllerToInt.XboxCommandBasic.ARROW_LEFT,
		XboxControllerToInt.XboxCommandBasic.ARROW_RIGHT,
		XboxControllerToInt.XboxCommandBasic.ARROW_UP,
		XboxControllerToInt.XboxCommandBasic.ARROW_DOWN,
		XboxControllerToInt.XboxCommandBasic.BUTTON_DOWN_A,
		XboxControllerToInt.XboxCommandBasic.BUTTON_RIGHT_B,
		XboxControllerToInt.XboxCommandBasic.BUTTON_MENU_LEFT,
		XboxControllerToInt.XboxCommandBasic.BUTTON_MENU_RIGHT
	)	

func play_nes_as_xbox_hollow_knight_silksong():
	override_all_nes_buttons_with_xbox(
		XboxControllerToInt.XboxCommandBasic.ARROW_LEFT,
		XboxControllerToInt.XboxCommandBasic.ARROW_RIGHT,
		XboxControllerToInt.XboxCommandBasic.ARROW_UP,
		XboxControllerToInt.XboxCommandBasic.ARROW_DOWN,
		XboxControllerToInt.XboxCommandBasic.BUTTON_DOWN_A,
		XboxControllerToInt.XboxCommandBasic.BUTTON_LEFT_X,
		XboxControllerToInt.XboxCommandBasic.BUTTON_MENU_LEFT,
		XboxControllerToInt.XboxCommandBasic.BUTTON_MENU_RIGHT
	)	
