## On Android the NES I bought are HID unkown. Is it the NES or the OTG. I dont know.
## But the DPAD is recognise as axis and all button are unkown and can be use a single button action.
class_name NesListenToUnknowNesDeviceOnAndroid
extends Node


signal on_global_unkown_down()
signal on_global_unkown_up()
signal on_global_unkown_changed(pressing:bool)

signal on_usb_gamepad_dpad_changed_raw(device_id:int, device_spawn_id:int, device_name:String, joystick_direction:Vector2)
signal on_usb_gamepad_dpad_changed_sourced(gamepad: NesListenToUnknowNesDeviceOnAndroid.AndroidPad)

@export var spawn_list_device_id :Array[int]
@export var allowed_device_name:Array[String] = ["USB gamepad"]

@export var use_debug_print:bool=true


func _ready():
	if use_debug_print:
		print("Connected Joypads:")
		for device_id in Input.get_connected_joypads():
			print("ID:", device_id, " Name:", Input.get_joy_name(device_id))

	global_unkown_state=false
	on_global_unkown_changed.emit(false)
	on_global_unkown_up.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


class AndroidPad:
	@export var device_id:int
	@export var device_spawn_id:int
	@export var device_name:String
	@export var current_direction:Vector2
	@export var previous_direction:Vector2
	@export var left:bool
	@export var right:bool
	@export var up:bool
	@export var down:bool

var pad_dictionary:Dictionary[int,AndroidPad] 

@export_group("Input State Debug")
@export var global_unkown_state :bool

func _is_first_time(device_id:int)->bool:
	for id in spawn_list_device_id:
		if id == device_id: 
			return false
	return true
	
	
func _notify_changed_gamepad(pad:AndroidPad):
	on_usb_gamepad_dpad_changed_raw.emit(pad.device_id, pad.device_spawn_id, pad.device_name, pad.current_direction)
	on_usb_gamepad_dpad_changed_sourced.emit(pad)
	if use_debug_print:
		print(", ".join([str(pad.device_id),str(pad.device_spawn_id), pad.device_name, str(pad.current_direction) ] )  )


func _input(event: InputEvent) -> void:
	var device_id = event.device
	var device_name = Input.get_joy_name(device_id)

	if use_debug_print:
		print("Event from Device ID:", device_id, " Name:", device_name)
		if device_id in Input.get_connected_joypads():
			print("Device ID exists in connected joypads")
		else:
			print("Device ID NOT found!")
	if event is InputEventKey and not event.is_echo():
		var is_pressed:=event.is_pressed()
		var e:InputEventKey = event as InputEventKey
		var key_as_string :=e.as_text()
		# var key_as_int := e.keycode
		# var key_as_physical := e.physical_keycode
		print(e.device)
		print(is_pressed)
		print(event)
		print(str(key_as_string))
		if is_pressed != global_unkown_state:
			global_unkown_state =is_pressed
			on_global_unkown_changed.emit(global_unkown_state)
		if is_pressed:
			on_global_unkown_down.emit()
			if use_debug_print:
				print("GLOBAL UNKOWN DOWN")
		else :
			on_global_unkown_up.emit()
			if use_debug_print:
				print("GLOBAL UNKOWN DOWN")
				
	if event is InputEventJoypadMotion :
		if allowed_device_name.has(device_name):
			var is_first_time := _is_first_time(device_id)
			if is_first_time:
				var pad :AndroidPad= AndroidPad.new()
				pad.device_id= device_id
				pad.device_name= device_name
				pad.device_spawn_id = spawn_list_device_id.size()
				spawn_list_device_id.append(device_id)
				pad_dictionary[device_id]= pad
			
			var pad := pad_dictionary[device_id]
			# Horizontal (usually axis 0)
			if event.axis == JOY_AXIS_LEFT_X:
				pad.previous_direction.x =pad.current_direction.x
				pad.previous_direction.y =pad.current_direction.y
				pad.current_direction.x = -event.axis_value
				_notify_changed_gamepad(pad)
				
			elif event.axis == JOY_AXIS_LEFT_Y:
				pad.previous_direction.x =pad.current_direction.x
				pad.previous_direction.y =pad.current_direction.y
				pad.current_direction.y = event.axis_value
				_notify_changed_gamepad(pad)	
