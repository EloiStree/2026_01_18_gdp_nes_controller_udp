
class_name NesSendIntegerMessageUdp
extends Node

# What compute we want to talk to
@export var ipv4_to_target := "127.0.0.1"

# What application we want to talk to
@export var port_to_target := 3615

# What controller we need to simulate 1-4 for example if Xbox
@export var player_to_target := 1
@export var use_debug_print: bool = false

var udp := PacketPeerUDP.new()


signal on_integer_sent(value_sent:int)
signal on_integer_sent_with_player_index(player_index:int,value_sent:int)


func get_signal_int_send():
	return on_integer_sent

func to_safe_int(text:String, default:int=0) -> int:
	var parsed = int(text)
	if parsed == null:
		return default
	return parsed
	#Let try it
	
func is_valide_ipv4(text: String) -> bool:
	var parts = text.split(".")
	if parts.size() != 4:
		return false
	for part in parts:
		# Make sure each part is a number
		if to_safe_int(part,-1)==-1:
			return false
		var num = int(part)
		if num < 0 or num > 255:
			return false
	return true
	
func set_target_ipv4(text:String):
	if is_valide_ipv4(text):
		ipv4_to_target= text;
	
func set_target_port(text:String):
	port_to_target= to_safe_int(text,3615);
	
func set_target_player_index(text:String):
	player_to_target= to_safe_int(text,1);


func send_integer(value_to_send: int):
	send_index_integer_to_target(player_to_target, value_to_send)
	
func send_index_integer_to_target( target_index: int, value_to_send: int):
	# In little endian format
	# First integer = player
	# Second integer = value

	udp.set_dest_address(ipv4_to_target, port_to_target)

	# 2 integers × 4 bytes each = 8 bytes total
	var data := PackedByteArray()
	data.resize(8)

	# Write player at byte offset 0
	data.encode_s32(0, target_index)

	# Write value at byte offset 4
	data.encode_s32(4, value_to_send)

	var err = udp.put_packet(data)

	on_integer_sent.emit(value_to_send)
	on_integer_sent_with_player_index.emit(target_index, value_to_send)
	
	if use_debug_print:
		if err == OK:
			print("Sent player:", target_index, "value:", value_to_send)
		else:
			print("UDP send failed:", err)
