extends Node

# What compute we want to talk to
@export var ipv4_to_target := "127.0.0.1"

# What application we want to talk to
@export var port_to_target := 3614

# What controller we need to simulate 1-4 for example if Xbox
@export var player_to_target := 1
@export var use_debug_print:bool =false


# UDP object we can reuse to send multiple messages
var udp := PacketPeerUDP.new()

func send_text_message_hello_world():
	send_text_message("Hello World")

func send_text_message(text: String):
	
	if use_debug_print:
		print(text)
	
	# Set the target address and port
	udp.set_dest_address(ipv4_to_target, port_to_target)
	
	# Convert the string to bytes (Godot 4 style)
	var data = text.to_utf8_buffer()
	
	# Send the UDP packet
	var err = udp.put_packet(data)
	if err != OK:
		print("Failed to send UDP packet:", err)
