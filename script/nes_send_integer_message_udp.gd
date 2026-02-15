
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
			

func send_pack_of_bytes(bytes: PackedByteArray):
	udp.set_dest_address(ipv4_to_target, port_to_target)
	udp.put_packet(bytes)

##  0 1300 0 , 0 2300 1000, 0 1300 2000, 0 2300 3000 ... 
func send_iid_array_to_target(iid_array_as_3_integer:Array[int]):

	# NOT TESTED YET.

	var count = iid_array_as_3_integer.size() / 3
	# prepare one by bytes block of 16 bytes integer index date 
	var data := PackedByteArray()
	data.resize(count * 16)
	for i in range(count):
		data.encode_s32(i * 16 + 0, iid_array_as_3_integer[i * 3 + 0]) # Write player at byte offset 0
		data.encode_s32(i * 16 + 4, iid_array_as_3_integer[i * 3 + 1]) # Write value at byte offset 4
		data.encode_u64(i * 16 + 8, iid_array_as_3_integer[i * 3 + 2]) # Write timestamp at byte offset 8
	send_pack_of_bytes(data)

func test_send_iid_array_of_a_b_x_y():
	var test_array:Array[int] = [
	  4, 1300, 0,    4, 2300, 1000
	, 4, 1301, 2000, 4, 2301, 3000
	, 4, 1302, 4000, 4, 2302, 5000
	, 4, 1303, 6000, 4, 2303, 7000]
	
	send_iid_array_to_target(test_array)
