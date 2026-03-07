class_name FacadeNesToUdp
extends Node

signal on_send_int_to_target(new_value:int)

@export_group("Main Component")
@export var udp_sender: NesSendIntegerMessageUdp
@export var nes_pad: NesControllerToInt
@export var int_delayer: NesIntDelayer
@export var xbox: XboxControllerToInt
@export var keyboard: KeyboardControllerToInt
@export var int_interpreter: NesIntMacroInterpreterToInt
@export var macro_default_interpreter: NesDefaultWordInterpretorToIntMacro	
@export var target_at_init:NesResTargetPlayerByUdp

@export var override_nes_integer_at_ready:NesableGameMappingAbstractGet

@export_group("For Debugging (Do not touch)")
@export var last_sent_int_to_target:int

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

@export var add_after_clear_xbox_unicode_macro:bool=true
@export var add_after_clear_nes_unicode_macro:bool=true
@export var add_after_clear_keyboard_unicode_macro:bool=true




# 🎮A 🕹️A ⌨️A
func _add_joystick_and_nes_default_macro():
	if add_after_clear_nes_unicode_macro:
		interpreter_add_word_to_integer_macro_from_text ("🕹️A", NesControllerToInt.NesButton.BUTTON_A)
		interpreter_add_word_to_integer_macro_from_text("🕹️B", NesControllerToInt.NesButton.BUTTON_B)
		interpreter_add_word_to_integer_macro_from_text("🕹️ML", NesControllerToInt.NesButton.MENU_LEFT)
		interpreter_add_word_to_integer_macro_from_text("🕹️MR", NesControllerToInt.NesButton.MENU_RIGHT)
		interpreter_add_word_to_integer_macro_from_text("🕹️AD", NesControllerToInt.NesButton.ARROW_DOWN)
		interpreter_add_word_to_integer_macro_from_text("🕹️AU", NesControllerToInt.NesButton.ARROW_UP)
		interpreter_add_word_to_integer_macro_from_text("🕹️AL", NesControllerToInt.NesButton.ARROW_LEFT)
		interpreter_add_word_to_integer_macro_from_text("🕹️AR", NesControllerToInt.NesButton.ARROW_RIGHT)
# 🕹️A 🕹️B 🕹️AL 🕹️AR 🕹️AD 🕹️AU 🕹️ML 🕹️MD 



	if add_after_clear_nes_unicode_macro:
# 🎮A 🎮B 🎮Y 🎮X
# 🎮ML 🎮MC 🎮MR  
# 🎮AL 🎮AR 🎮AD 🎮AU
# 🎮SBL 🎮SBL 🎮TL 🎮TR
# 🎮AL 🎮AR 🎮AD 🎮AU 
# 🎮JL 🎮JR 
# 🎮JLU 🎮JLR 🎮JLD 🎮JLL
# 🎮JRU 🎮JRR 🎮JRD 🎮JRL
		interpreter_add_word_to_integer_macro_from_text("🎮A", XboxControllerToInt.XboxCommandBasic.BUTTON_DOWN_A)
		interpreter_add_word_to_integer_macro_from_text("🎮B", XboxControllerToInt.XboxCommandBasic.BUTTON_RIGHT_B)
		interpreter_add_word_to_integer_macro_from_text("🎮X", XboxControllerToInt.XboxCommandBasic.BUTTON_LEFT_X)
		interpreter_add_word_to_integer_macro_from_text("🎮Y", XboxControllerToInt.XboxCommandBasic.BUTTON_UP_Y)
		interpreter_add_word_to_integer_macro_from_text("🎮ML",XboxControllerToInt.XboxCommandBasic.BUTTON_MENU_LEFT)
		interpreter_add_word_to_integer_macro_from_text("🎮MR",XboxControllerToInt.XboxCommandBasic.BUTTON_MENU_RIGHT)
		interpreter_add_word_to_integer_macro_from_text("🎮MC",XboxControllerToInt.XboxCommandBasic.XBOX_HOME_BUTTON)		
		interpreter_add_word_to_integer_macro_from_text("🎮AL",XboxControllerToInt.XboxCommandBasic.ARROW_LEFT)
		interpreter_add_word_to_integer_macro_from_text("🎮AR",XboxControllerToInt.XboxCommandBasic.ARROW_RIGHT)
		interpreter_add_word_to_integer_macro_from_text("🎮AD",XboxControllerToInt.XboxCommandBasic.ARROW_DOWN)
		interpreter_add_word_to_integer_macro_from_text("🎮AU",XboxControllerToInt.XboxCommandBasic.ARROW_UP)
		interpreter_add_word_to_integer_macro_from_text("🎮TL",XboxControllerToInt.XboxCommandBasic.LEFT_TRIGGER_100)
		interpreter_add_word_to_integer_macro_from_text("🎮TR",XboxControllerToInt.XboxCommandBasic.RIGHT_TRIGGER_100)
		interpreter_add_word_to_integer_macro_from_text("🎮SBL",XboxControllerToInt.XboxCommandBasic.BUTTON_LEFT_SIDE)
		interpreter_add_word_to_integer_macro_from_text("🎮SBR",XboxControllerToInt.XboxCommandBasic.BUTTON_RIGHT_SIDE)
		interpreter_add_word_to_integer_macro_from_text("🎮JL",XboxControllerToInt.XboxCommandBasic.BUTTON_LEFT_STICK)
		interpreter_add_word_to_integer_macro_from_text("🎮JR",XboxControllerToInt.XboxCommandBasic.BUTTON_RIGHT_STICK)
		interpreter_add_word_to_integer_macro_from_text("🎮JLU",XboxControllerToInt.XboxCommandBasic.LEFT_STICK_VERTICAL_P100)
		interpreter_add_word_to_integer_macro_from_text("🎮JLR",XboxControllerToInt.XboxCommandBasic.LEFT_STICK_HORIZONTAL_P100)
		interpreter_add_word_to_integer_macro_from_text("🎮JLD",XboxControllerToInt.XboxCommandBasic.LEFT_STICK_VERTICAL_N100)
		interpreter_add_word_to_integer_macro_from_text("🎮JLL",XboxControllerToInt.XboxCommandBasic.LEFT_STICK_HORIZONTAL_N100)
		interpreter_add_word_to_integer_macro_from_text("🎮JRU",XboxControllerToInt.XboxCommandBasic.RIGHT_STICK_VERTICAL_P100)
		interpreter_add_word_to_integer_macro_from_text("🎮JRR",XboxControllerToInt.XboxCommandBasic.RIGHT_STICK_HORIZONTAL_P100)
		interpreter_add_word_to_integer_macro_from_text("🎮JRD",XboxControllerToInt.XboxCommandBasic.RIGHT_STICK_VERTICAL_N100)
		interpreter_add_word_to_integer_macro_from_text("🎮JRL",XboxControllerToInt.XboxCommandBasic.RIGHT_STICK_HORIZONTAL_N100)
	if add_after_clear_keyboard_unicode_macro:
		# # ⌨️A ⌨️B ⌨️C ⌨️D ⌨️E ⌨️F ⌨️G ⌨️H ⌨️I ⌨️J ⌨️K ⌨️L ⌨️M ⌨️N ⌨️O ⌨️P ⌨️Q ⌨️R ⌨️S ⌨️T ⌨️U ⌨️V ⌨️W ⌨️X ⌨️Y ⌨️Z
		# # ⌨️0 ⌨️1 ⌨️2 ⌨️3 ⌨️4 ⌨️5 ⌨️6 ⌨️7 ⌨️8 ⌨️9
		# # ⌨️F1 ⌨️F2 ⌨️F3 ⌨️F4 ⌨️F5 ⌨️F6 ⌨️F7 ⌨️F8 ⌨️F9 ⌨️F10 ⌨️F11 ⌨️F12
		# # ⌨️ESC ⌨️TAB ⌨️CAPS ⌨️LSHIFT ⌨️LCTRL ⌨️LALT ⌨️SPACE ⌨️RALT ⌨️RCTRL ⌨️RSHIFT ⌨️ENTER ⌨️BACKSPACE ⌨️INS ⌨️DEL ⌨️HOME ⌨️END ⌨️PGUP ⌨️PGDN
		# # ⌨️MINUS  ⌨️EQUAL ⌨️DIVIDE ⌨️MULTIPLY 
		# # ⌨️LEFT ⌨️RIGHT ⌨️UP ⌨️DOWN ⌨️AL ⌨️AR ⌨️AU ⌨️AD

		interpreter_add_word_to_integer_macro_from_text("⌨️A", KeyboardControllerToInt.KeyboardCommandInt.A)
		interpreter_add_word_to_integer_macro_from_text("⌨️B", KeyboardControllerToInt.KeyboardCommandInt.B)
		interpreter_add_word_to_integer_macro_from_text("⌨️C", KeyboardControllerToInt.KeyboardCommandInt.C)
		interpreter_add_word_to_integer_macro_from_text("⌨️D", KeyboardControllerToInt.KeyboardCommandInt.D)
		interpreter_add_word_to_integer_macro_from_text("⌨️E", KeyboardControllerToInt.KeyboardCommandInt.E)
		interpreter_add_word_to_integer_macro_from_text("⌨️F", KeyboardControllerToInt.KeyboardCommandInt.F)
		interpreter_add_word_to_integer_macro_from_text("⌨️G", KeyboardControllerToInt.KeyboardCommandInt.G)
		interpreter_add_word_to_integer_macro_from_text("⌨️H", KeyboardControllerToInt.KeyboardCommandInt.H)
		interpreter_add_word_to_integer_macro_from_text("⌨️I", KeyboardControllerToInt.KeyboardCommandInt.I)
		interpreter_add_word_to_integer_macro_from_text("⌨️J", KeyboardControllerToInt.KeyboardCommandInt.J)
		interpreter_add_word_to_integer_macro_from_text("⌨️K", KeyboardControllerToInt.KeyboardCommandInt.K)
		interpreter_add_word_to_integer_macro_from_text("⌨️L", KeyboardControllerToInt.KeyboardCommandInt.L)
		interpreter_add_word_to_integer_macro_from_text("⌨️M", KeyboardControllerToInt.KeyboardCommandInt.M)
		interpreter_add_word_to_integer_macro_from_text("⌨️N", KeyboardControllerToInt.KeyboardCommandInt.N)
		interpreter_add_word_to_integer_macro_from_text("⌨️O", KeyboardControllerToInt.KeyboardCommandInt.O)
		interpreter_add_word_to_integer_macro_from_text("⌨️P", KeyboardControllerToInt.KeyboardCommandInt.P)
		interpreter_add_word_to_integer_macro_from_text("⌨️Q", KeyboardControllerToInt.KeyboardCommandInt.Q)
		interpreter_add_word_to_integer_macro_from_text("⌨️R", KeyboardControllerToInt.KeyboardCommandInt.R)
		interpreter_add_word_to_integer_macro_from_text("⌨️S", KeyboardControllerToInt.KeyboardCommandInt.S)
		interpreter_add_word_to_integer_macro_from_text("⌨️T", KeyboardControllerToInt.KeyboardCommandInt.T)
		interpreter_add_word_to_integer_macro_from_text("⌨️U", KeyboardControllerToInt.KeyboardCommandInt.U)
		interpreter_add_word_to_integer_macro_from_text("⌨️V", KeyboardControllerToInt.KeyboardCommandInt.V)
		interpreter_add_word_to_integer_macro_from_text("⌨️W", KeyboardControllerToInt.KeyboardCommandInt.W)
		interpreter_add_word_to_integer_macro_from_text("⌨️X", KeyboardControllerToInt.KeyboardCommandInt.X)
		interpreter_add_word_to_integer_macro_from_text("⌨️Y", KeyboardControllerToInt.KeyboardCommandInt.Y)
		interpreter_add_word_to_integer_macro_from_text("⌨️Z", KeyboardControllerToInt.KeyboardCommandInt.Z)
		interpreter_add_word_to_integer_macro_from_text("⌨️0", KeyboardControllerToInt.KeyboardCommandInt.Alpha0)
		interpreter_add_word_to_integer_macro_from_text("⌨️1", KeyboardControllerToInt.KeyboardCommandInt.Alpha1)
		interpreter_add_word_to_integer_macro_from_text("⌨️2", KeyboardControllerToInt.KeyboardCommandInt.Alpha2)
		interpreter_add_word_to_integer_macro_from_text("⌨️3", KeyboardControllerToInt.KeyboardCommandInt.Alpha3)
		interpreter_add_word_to_integer_macro_from_text("⌨️4", KeyboardControllerToInt.KeyboardCommandInt.Alpha4)
		interpreter_add_word_to_integer_macro_from_text("⌨️5", KeyboardControllerToInt.KeyboardCommandInt.Alpha5)
		interpreter_add_word_to_integer_macro_from_text("⌨️6", KeyboardControllerToInt.KeyboardCommandInt.Alpha6)
		interpreter_add_word_to_integer_macro_from_text("⌨️7", KeyboardControllerToInt.KeyboardCommandInt.Alpha7)
		interpreter_add_word_to_integer_macro_from_text("⌨️8", KeyboardControllerToInt.KeyboardCommandInt.Alpha8)
		interpreter_add_word_to_integer_macro_from_text("⌨️9", KeyboardControllerToInt.KeyboardCommandInt.Alpha9)
		interpreter_add_word_to_integer_macro_from_text("⌨️F1", KeyboardControllerToInt.KeyboardCommandInt.F1)
		interpreter_add_word_to_integer_macro_from_text("⌨️F2", KeyboardControllerToInt.KeyboardCommandInt.F2)
		interpreter_add_word_to_integer_macro_from_text("⌨️F3", KeyboardControllerToInt.KeyboardCommandInt.F3)
		interpreter_add_word_to_integer_macro_from_text("⌨️F4", KeyboardControllerToInt.KeyboardCommandInt.F4)
		interpreter_add_word_to_integer_macro_from_text("⌨️F5", KeyboardControllerToInt.KeyboardCommandInt.F5)
		interpreter_add_word_to_integer_macro_from_text("⌨️F6", KeyboardControllerToInt.KeyboardCommandInt.F6)
		interpreter_add_word_to_integer_macro_from_text("⌨️F7", KeyboardControllerToInt.KeyboardCommandInt.F7)
		interpreter_add_word_to_integer_macro_from_text("⌨️F8", KeyboardControllerToInt.KeyboardCommandInt.F8)
		interpreter_add_word_to_integer_macro_from_text("⌨️F9", KeyboardControllerToInt.KeyboardCommandInt.F9)
		interpreter_add_word_to_integer_macro_from_text("⌨️F10", KeyboardControllerToInt.KeyboardCommandInt.F10)
		interpreter_add_word_to_integer_macro_from_text("⌨️F11", KeyboardControllerToInt.KeyboardCommandInt.F11)
		interpreter_add_word_to_integer_macro_from_text("⌨️F12", KeyboardControllerToInt.KeyboardCommandInt.F12)
		interpreter_add_word_to_integer_macro_from_text("⌨️ESC", KeyboardControllerToInt.KeyboardCommandInt.Escape)
		interpreter_add_word_to_integer_macro_from_text("⌨️TAB", KeyboardControllerToInt.KeyboardCommandInt.Tab)
		interpreter_add_word_to_integer_macro_from_text("⌨️CAPS", KeyboardControllerToInt.KeyboardCommandInt.CapsLock)
		interpreter_add_word_to_integer_macro_from_text("⌨️LSHIFT", KeyboardControllerToInt.KeyboardCommandInt.LeftShift)
		interpreter_add_word_to_integer_macro_from_text("⌨️LCTRL", KeyboardControllerToInt.KeyboardCommandInt.LeftControl)
		interpreter_add_word_to_integer_macro_from_text("⌨️LALT", KeyboardControllerToInt.KeyboardCommandInt.LeftAlt)
		interpreter_add_word_to_integer_macro_from_text("⌨️SPACE", KeyboardControllerToInt.KeyboardCommandInt.Space)
		interpreter_add_word_to_integer_macro_from_text("⌨️RALT", KeyboardControllerToInt.KeyboardCommandInt.RightAlt)
		interpreter_add_word_to_integer_macro_from_text("⌨️RCTRL", KeyboardControllerToInt.KeyboardCommandInt.RightControl)
		interpreter_add_word_to_integer_macro_from_text("⌨️RSHIFT", KeyboardControllerToInt.KeyboardCommandInt.RightShift)
		interpreter_add_word_to_integer_macro_from_text("⌨️ENTER", KeyboardControllerToInt.KeyboardCommandInt.Enter)
		interpreter_add_word_to_integer_macro_from_text("⌨️BACKSPACE", KeyboardControllerToInt.KeyboardCommandInt.Backspace)
		interpreter_add_word_to_integer_macro_from_text("⌨️INS", KeyboardControllerToInt.KeyboardCommandInt.Insert)
		interpreter_add_word_to_integer_macro_from_text("⌨️DEL", KeyboardControllerToInt.KeyboardCommandInt.Delete)
		interpreter_add_word_to_integer_macro_from_text("⌨️HOME", KeyboardControllerToInt.KeyboardCommandInt.Home)
		interpreter_add_word_to_integer_macro_from_text("⌨️END", KeyboardControllerToInt.KeyboardCommandInt.End)
		interpreter_add_word_to_integer_macro_from_text("⌨️PGUP", KeyboardControllerToInt.KeyboardCommandInt.PageUp)
		interpreter_add_word_to_integer_macro_from_text("⌨️PGDN", KeyboardControllerToInt.KeyboardCommandInt.PageDown)
		interpreter_add_word_to_integer_macro_from_text("⌨️MINUS", KeyboardControllerToInt.KeyboardCommandInt.NumpadSubtract)
		interpreter_add_word_to_integer_macro_from_text("⌨️DIVIDE", KeyboardControllerToInt.KeyboardCommandInt.NumpadDivide)
		interpreter_add_word_to_integer_macro_from_text("⌨️MULTIPLY", KeyboardControllerToInt.KeyboardCommandInt.NumpadMultiply)
		interpreter_add_word_to_integer_macro_from_text("⌨️LEFT", KeyboardControllerToInt.KeyboardCommandInt.Left)
		interpreter_add_word_to_integer_macro_from_text("⌨️RIGHT", KeyboardControllerToInt.KeyboardCommandInt.Right)
		interpreter_add_word_to_integer_macro_from_text("⌨️UP", KeyboardControllerToInt.KeyboardCommandInt.Up)
		interpreter_add_word_to_integer_macro_from_text("⌨️AD", KeyboardControllerToInt.KeyboardCommandInt.Down)
		interpreter_add_word_to_integer_macro_from_text("⌨️AL", KeyboardControllerToInt.KeyboardCommandInt.Left)
		interpreter_add_word_to_integer_macro_from_text("⌨️AR", KeyboardControllerToInt.KeyboardCommandInt.Right)
		interpreter_add_word_to_integer_macro_from_text("⌨️AU", KeyboardControllerToInt.KeyboardCommandInt.Up)
		

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
		
		if int_interpreter != null:
			int_interpreter.on_integer_to_send_requested.connect(_send_integer_to_udp_target)
			int_interpreter.on_integer_to_send_requested_with_milliseconds_delay.connect(_append_integer_with_delay_to_udp_target)
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






#region MACRO INTERPRETOR

func interpreter_translate_text_to_integer_event(text:String)->void:
	var macro_int = macro_default_interpreter.parse_text_to_integer_macro(text)	
	int_interpreter.translate_text_to_integer_event(macro_int)

func interpreter_translate_text_to_a_package_of_integer_for_target(text:String):
	var macro_int:String = macro_default_interpreter.parse_text_to_integer_macro(text)	
	var package := int_interpreter.build_integer_remote_array_iid(0,macro_int)
	get_udp_sender().send_iid_package_to_target(package)

func interpreter_clear_and_add_word_to_integer_macro_from_text(config_text:String):
	macro_default_interpreter.clear_and_add_word_to_integer_macro_from_text(config_text)
	_add_joystick_and_nes_default_macro()
	

func interpreter_clear_and_add_word_to_text_macro_from_text(config_text:String):
	macro_default_interpreter.clear_and_add_word_to_text_macro_from_text(config_text)

func interpreter_add_word_to_integer_macro_from_text(key:String, value:int):
	macro_default_interpreter.add_word_to_integer_macro(key, value)


func interpreter_add_word_to_text_macro_from_text(key:String, value:String):
	macro_default_interpreter.add_word_to_text_macro(key, value)

func get_interpreter_translation_as_abstract_int_macro(text_to_parse:String)->String:
	var text = macro_default_interpreter.parse_text_to_integer_macro(text_to_parse)
	var final_text = int_interpreter.translate_text_to_debug_final_integer_text(text)
	return final_text
	
func get_interpreter_translation_as_relative_int_macro(text_to_parse:String)->String:
	var text = macro_default_interpreter.parse_text_to_integer_macro(text_to_parse)
	return text
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

## This interpetor is basic and only works with integers
func get_integer_interpreter()->NesIntMacroInterpreterToInt:
	return int_interpreter

## This interpetor use word and text to build a integer macro
func get_macro_interpretor()-> NesDefaultWordInterpretorToIntMacro:
	return macro_default_interpreter

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
