# class name It allows other script ot refert to it
class_name KeyboardControllerToInt extends Node


static var char_to_integer := {
	" ":4032,
	"!":4033,
	"\"":4034,
	"#":4035,
	"$":4036,
	"%":4037,
	"&":4038,
	"'":4039,
	"(":4040,
	")":4041,
	"*":4042,
	"+":4043,
	",":4044,
	"-":4045,
	".":4046,
	"/":4047,
	"0":4048,
	"1":4049,
	"2":4050,
	"3":4051,
	"4":4052,
	"5":4053,
	"6":4054,
	"7":4055,
	"8":4056,
	"9":4057,
	":":4058,
	";":4059,
	"<":4060,
	"=":4061,
	">":4062,
	"?":4063,
	"@":4064,
	"A":4065,
	"B":4066,
	"C":4067,
	"D":4068,
	"E":4069,
	"F":4070,
	"G":4071,
	"H":4072,
	"I":4073,
	"J":4074,
	"K":4075,
	"L":4076,
	"M":4077,
	"N":4078,
	"O":4079,
	"P":4080,
	"Q":4081,
	"R":4082,
	"S":4083,
	"T":4084,
	"U":4085,
	"V":4086,
	"W":4087,
	"X":4088,
	"Y":4089,
	"Z":4090,
	"[":4091,
	"\\":4092,
	"]":4093,
	"^":4094,
	"_":4095,
	"`":4096,
	"a":4097,
	"b":4098,
	"c":4099,
	"d":4100,
	"e":4101,
	"f":4102,
	"g":4103,
	"h":4104,
	"i":4105,
	"j":4106,
	"k":4107,
	"l":4108,
	"m":4109,
	"n":4110,
	"o":4111,
	"p":4112,
	"q":4113,
	"r":4114,
	"s":4115,
	"t":4116,
	"u":4117,
	"v":4118,
	"w":4119,
	"x":4120,
	"y":4121,
	"z":4122,
	"{":4123,
	"|":4124,
	"}":4125,
	"~":4126,
	"\u00A0":4160,
	"¡":4161,
	"¢":4162,
	"£":4163,
	"¤":4164,
	"¥":4165,
	"¦":4166,
	"§":4167,
	"¨":4168,
	"©":4169,
	"ª":4170,
	"«":4171,
	"¬":4172,
	"\u00AD":4173,
	"®":4174,
	"¯":4175,
	"°":4176,
	"±":4177,
	"²":4178,
	"³":4179,
	"´":4180,
	"µ":4181,
	"¶":4182,
	"·":4183,
	"¸":4184,
	"¹":4185,
	"º":4186,
	"»":4187,
	"¼":4188,
	"½":4189,
	"¾":4190,
	"¿":4191,
	"À":4192,
	"Á":4193,
	"Â":4194,
	"Ã":4195,
	"Ä":4196,
	"Å":4197,
	"Æ":4198,
	"Ç":4199,
	"È":4200,
 	"É":4201,
	"Ê":4202,
	"Ë":4203,
	"Ì":4204,
	"Í":4205,
	"Î":4206,
	"Ï":4207,
	"Ð":4208,
	"Ñ":4209,
	"Ò":4210,
	"Ó":4211,
	"Ô":4212,
	"Õ":4213,
	"Ö":4214,
	"×":4215,
	"Ø":4216,
	"Ù":4217,
	"Ú":4218,
	"Û":4219,
	"Ü":4220,
	"Ý":4221,
	"Þ":4222,
	"ß":4223,
	"à":4224,
	"á":4225,
	"â":4226,
	"ã":4227,
	"ä":4228,
	"å":4229,
	"æ":4230,
	"ç":4231,
	"è":4232,
	"é":4233,
	"ê":4234,
	"ë":4235,
	"ì":4236,
	"í":4237,
	"î":4238,
	"ï":4239,
	"ð":4240,
	"ñ":4241,
	"ò":4242,
	"ó":4243,
	"ô":4244,
	"õ":4245,
	"ö":4246,
	"÷":4247,
	"ø":4248,
	"ù":4249,
	"ú":4250,
	"û":4251,
	"ü":4252,
	"ý":4253,
	"þ":4254,
	"ÿ":4255
}


enum KeyboardCommandInt {
	ReleaseAll = 1000,
	ClearTimedCommand = 1256,
	Backspace = 1008,
	Tab = 1009,
	Clear = 1012,
	Enter = 1013,
	Shift = 1016,
	Ctrl = 1017,
	Alt = 1018,
	Pause = 1019,
	CapsLock = 1020,
	Escape = 1027,
	Space = 1032,
	PageUp = 1033,
	PageDown = 1034,
	End = 1035,
	Home = 1036,
	Left = 1037,
	Up = 1038,
	Right = 1039,
	Down = 1040,
	Select = 1041,
	Print = 1042,
	Execute = 1043,
	PrintScreen = 1044,
	Insert = 1045,
	Delete = 1046,

	Alpha0 = 1048,
	Alpha1 = 1049,
	Alpha2 = 1050,
	Alpha3 = 1051,
	Alpha4 = 1052,
	Alpha5 = 1053,
	Alpha6 = 1054,
	Alpha7 = 1055,
	Alpha8 = 1056,
	Alpha9 = 1057,

	A = 1065, B = 1066, C = 1067, D = 1068, E = 1069, F = 1070,
	G = 1071, H = 1072, I = 1073, J = 1074, K = 1075, L = 1076,
	M = 1077, N = 1078, O = 1079, P = 1080, Q = 1081, R = 1082,
	S = 1083, T = 1084, U = 1085, V = 1086, W = 1087, X = 1088,
	Y = 1089, Z = 1090,

	LeftWindows = 1091,
	RightWindows = 1092,
	Applications = 1093,
	Sleep = 1095,

	Numpad0 = 1096,
	Numpad1 = 1097,
	Numpad2 = 1098,
	Numpad3 = 1099,
	Numpad4 = 1100,
	Numpad5 = 1101,
	Numpad6 = 1102,
	Numpad7 = 1103,
	Numpad8 = 1104,
	Numpad9 = 1105,

	NumpadMultiply = 1106,
	NumpadAdd = 1107,
	NumpadSeparator = 1108,
	NumpadSubtract = 1109,
	NumpadDecimal = 1110,
	NumpadDivide = 1111,

	F1 = 1112, F2 = 1113, F3 = 1114, F4 = 1115,
	F5 = 1116, F6 = 1117, F7 = 1118, F8 = 1119,
	F9 = 1120, F10 = 1121, F11 = 1122, F12 = 1123,
	F13 = 1124, F14 = 1125, F15 = 1126, F16 = 1127,
	F17 = 1128, F18 = 1129, F19 = 1130, F20 = 1131,
	F21 = 1132, F22 = 1133, F23 = 1134, F24 = 1135,

	NumLock = 1144,
	ScrollLock = 1145,

	LeftShift = 1160,
	RightShift = 1161,
	LeftControl = 1162,
	RightControl = 1163,
	LeftAlt = 1164,
	RightAlt = 1165,

	BrowserBack = 1166,
	BrowserForward = 1167,
	BrowserRefresh = 1168,
	BrowserStop = 1169,
	BrowserSearch = 1170,
	BrowserFavorites = 1171,
	BrowserHome = 1172,

	VolumeMute = 1173,
	VolumeDown = 1174,
	VolumeUp = 1175,

	MediaNextTrack = 1176,
	MediaPreviousTrack = 1177,
	MediaStop = 1178,
	MediaPlay = 1179,

	LaunchMail = 1180,
	LaunchMediaSelect = 1181,
	LaunchApp1 = 1182,
	LaunchApp2 = 1183,

	OEM1 = 1186,
	OEMPlus = 1187,
	OEMComma = 1188,
	OEMMinus = 1189,
	OEMPeriod = 1190,
	OEM2 = 1191,
	OEM3 = 1192,

	OEM4 = 1219,
	OEM5 = 1220,
	OEM6 = 1221,
	OEM7 = 1222,
	OEM8 = 1223,
	OEM102 = 1226,

	ProcessKey = 1229,
	Packet = 1231,

	Attn = 1246,
	CrSel = 1247,
	ExSel = 1248,
	EraseEOF = 1249,
	Play = 1250,
	Zoom = 1251,
	PA1 = 1253
}





@export var use_print_debugging:bool

signal on_integer_to_send_requested(integer_action:int)
signal on_integer_with_millisecond_delay_to_send_requested(integer_action:int, delay_in_milliseconds:int)

#region GENERIC METHODE


func get_char_int_value_from_char(char_value:String)->int:
	if char_value in char_to_integer:
		return char_to_integer[char_value]
	else:
		return -1

func get_key_int_value_from_enum(enum_value: KeyboardCommandInt)->int:
	return int(enum_value)
	
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


func request_to_write_char_utf8_value(char_value:String):
	var char_int_value = get_char_int_value_from_char(char_value)
	if char_int_value != -1:
		stroke_key_no_delay(char_int_value)

#endregion



#region press and release Main keyboard key

# SPACE
func press_space():
	press_key(KeyboardCommandInt.Space)
func release_space():
	release_key(KeyboardCommandInt.Space)
func set_key_space_down_up(is_down:bool):
	set_key_down_up(KeyboardCommandInt.Space, is_down)

# ENTER
func press_enter():
	press_key(KeyboardCommandInt.Enter)
func release_enter():
	release_key(KeyboardCommandInt.Enter)
func set_key_enter_down_up(is_down:bool):
	set_key_down_up(KeyboardCommandInt.Enter, is_down)

# BACKSPACE
func press_backspace():
	press_key(KeyboardCommandInt.Backspace)
func release_backspace():
	release_key(KeyboardCommandInt.Backspace)
func set_key_backspace_down_up(is_down:bool):
	set_key_down_up(KeyboardCommandInt.Backspace, is_down)


# TAB
func press_tab():
	press_key(KeyboardCommandInt.Tab)
func release_tab():
	release_key(KeyboardCommandInt.Tab)
func set_key_tab_down_up(is_down:bool):
	set_key_down_up(KeyboardCommandInt.Tab, is_down)


# LEFT SHIFT
func press_left_shift():
	press_key(KeyboardCommandInt.LeftShift)
func release_left_shift():
	release_key(KeyboardCommandInt.LeftShift)
func set_key_left_shift_down_up(is_down:bool):
	set_key_down_up(KeyboardCommandInt.LeftShift, is_down)

# LEFT CONTROL

func press_left_control():
	press_key(KeyboardCommandInt.LeftControl)
func release_left_control():
	release_key(KeyboardCommandInt.LeftControl)
func set_key_left_control_down_up(is_down:bool):
	set_key_down_up(KeyboardCommandInt.LeftControl, is_down)

# LEFT ALT
func press_left_alt():
	press_key(KeyboardCommandInt.LeftAlt)
func release_left_alt():
	release_key(KeyboardCommandInt.LeftAlt)
func set_key_left_alt_down_up(is_down:bool):
	set_key_down_up(KeyboardCommandInt.LeftAlt, is_down)
# ESCAPE
func press_escape():
	press_key(KeyboardCommandInt.Escape)
func release_escape():
	release_key(KeyboardCommandInt.Escape)
func set_key_escape_down_up(is_down:bool):
	set_key_down_up(KeyboardCommandInt.Escape, is_down)
# DELETE
func press_delete():
	press_key(KeyboardCommandInt.Delete)
func release_delete():
	release_key(KeyboardCommandInt.Delete)
func set_key_delete_down_up(is_down:bool):
	set_key_down_up(KeyboardCommandInt.Delete, is_down)



#endregion





func press_enum_key(enum_key:KeyboardCommandInt):
	press_key(enum_key)

func release_enum_key(enum_key:KeyboardCommandInt):
	release_key(enum_key)	

func stroke_enum_key_no_delay(enum_key:KeyboardCommandInt):
	stroke_key_no_delay(enum_key)	

func press_enum_key_in_milliseconds(enum_key:KeyboardCommandInt, press_duration_milliseconds:int):
	press_key_in_milliseconds(enum_key, press_duration_milliseconds)

func release_enum_key_in_milliseconds(enum_key:KeyboardCommandInt, release_delay_milliseconds:int):
	release_key_in_milliseconds(enum_key, release_delay_milliseconds)

func press_enum_key_in_seconds(enum_key:KeyboardCommandInt, press_duration_seconds:float):
	press_key_in_seconds(enum_key, press_duration_seconds)	

func release_enum_key_in_seconds(enum_key:KeyboardCommandInt, release_delay_seconds:float):
	release_key_in_seconds(enum_key, release_delay_seconds)


func stroke_enum_key_for_milliseconds(enum_key:KeyboardCommandInt, press_duration_milliseconds:int):
	stroke_key_for_milliseconds(enum_key, press_duration_milliseconds)	

func stroke_enum_key_for_seconds(enum_key:KeyboardCommandInt, press_duration_seconds:float):
	stroke_key_for_seconds(enum_key, press_duration_seconds)


func stroke_enum_key_in_milliseconds(enum_key:KeyboardCommandInt, delay_milliseconds:int, press_duration_milliseconds:int):
	stroke_key_in_milliseconds(enum_key, delay_milliseconds, press_duration_milliseconds)


func stroke_enum_key_in_seconds(enum_key:KeyboardCommandInt, delay_seconds:float, press_duration_seconds:float):
	stroke_key_in_seconds(enum_key, delay_seconds, press_duration_seconds)

func several_enum_click(enum_key:KeyboardCommandInt, number_of_clicks:int, delay_between_clicks_milliseconds:int, press_duration_milliseconds:int):
	several_click(enum_key, number_of_clicks, delay_between_clicks_milliseconds, press_duration_milliseconds)

func double_enum_click(enum_key:KeyboardCommandInt, delay_between_clicks_milliseconds:int, press_duration_milliseconds:int):
	double_click(enum_key, delay_between_clicks_milliseconds, press_duration_milliseconds)

func triple_enum_click(enum_key:KeyboardCommandInt, delay_between_clicks_milliseconds:int, press_duration_milliseconds:int):
	triple_click(enum_key, delay_between_clicks_milliseconds, press_duration_milliseconds)

	
	

	
	
	
	
