extends Node


@export var nes: FacadeNesToUdp
@export var ip_target:String ="192.168.1.1"

var left = NesControllerToInt.NesButton.ARROW_LEFT
var right = NesControllerToInt.NesButton.ARROW_RIGHT
var up = NesControllerToInt.NesButton.ARROW_UP
var down = NesControllerToInt.NesButton.ARROW_DOWN
var jump = NesControllerToInt.NesButton.BUTTON_A
var attack = NesControllerToInt.NesButton.BUTTON_B
var menu_left= NesControllerToInt.NesButton.MENU_LEFT
var menu_right= NesControllerToInt.NesButton.MENU_RIGHT

var button_a = NesControllerToInt.NesButton.BUTTON_A

func short_enum( enum_value:NesControllerToInt.NesButton, seconds:float):
	nes.stroke_key_with_enum_in_seconds(enum_value,seconds,0.1)

func short_menu_right(seconds:float):
	short_enum(menu_right,seconds)

func short_down(seconds:float):
	short_enum(down,seconds)
	
func short_up(seconds:float):
	short_enum(up,seconds)
	
func short_validate(seconds:float):
	short_enum(button_a,seconds)
	
func a_jump_min(seconds:float):
	nes.stroke_key_with_enum_in_seconds(jump,seconds,0.05)
func a_jump_medium(seconds:float):
	nes.stroke_key_with_enum_in_seconds(jump,seconds,0.4)
func a_jump_max(seconds:float):
	nes.stroke_key_with_enum_in_seconds(jump,seconds,1.0)

func a_move_left(seconds:float,seconds_run:float):
	nes.stroke_key_with_enum_in_seconds(left,seconds,seconds_run)
func a_jump_for(seconds:float,seconds_jump:float):
	nes.stroke_key_with_enum_in_seconds(jump,seconds,seconds_jump)
	
func restart_level(r:float):
	short_menu_right(r+1)
	short_down(r+3)
	short_down(r+5)
	short_validate(r+7)
	short_up(r+9)
	short_validate(r+11)
	short_validate(r+18)
	short_validate(r+20)
	a_jump_min(r+30)
	a_jump_medium(r+34)
	a_jump_max(r+38)

func _ready() -> void:
	var time:float=0
	
	var r =0
	#restart_level()
	#r =38
	
	#
	#r =r+14
	r =0

func set_ip_and_button_x():
	nes.set_button_b_to_x()
	nes.set_target_ipv4(ip_target)
	
func step_001(r:float):
	nes.stroke_key_with_enum_in_seconds(menu_left,r+1,0.2)
	nes.stroke_key_with_enum_in_seconds(menu_left,r+1.5,0.2)
	nes.stroke_key_with_enum_in_seconds(left,r+2.5,10)
	nes.stroke_key_with_enum_in_seconds(jump,r+5,1)
	nes.stroke_key_with_enum_in_seconds(jump,r+6.5,1)
	nes.stroke_key_with_enum_in_seconds(jump,r+14,1)
	nes.stroke_key_with_enum_in_seconds(jump,r+15,2)
	nes.stroke_key_with_enum_in_seconds(right,r+13.1,1.5)
	

func step_002(r:float):
	a_jump_for(0,2)
	a_move_left(0.1,3.8)
	a_jump_for(2.1,2)
	
	a_move_left(4.8,4)
	a_jump_for(5,2)
	a_jump_for(7,2.5)
	
