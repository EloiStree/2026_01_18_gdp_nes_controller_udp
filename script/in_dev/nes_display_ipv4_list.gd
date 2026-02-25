class_name NesDisplayIpv4List
extends Node

signal on_refresh_ipv4_debug_text(text: String)
signal on_refresh_ipv4_debug_text_array(text: PackedStringArray)

@export var text_join: String = ","
@export var text_display_debug: String

func _ready() -> void:
	refresh()

func get_ipv4_addresses() -> PackedStringArray:
	var result: PackedStringArray = []
	var ips: PackedStringArray = IP.get_local_addresses()
	
	for ip in ips:
		# Skip loopback if you don’t want 127.0.0.1
		if "." in ip and not ip.begins_with("127."):
			result.append(ip)
	
	return result

func refresh():
	var addresses = get_ipv4_addresses()
	var text = text_join.join(addresses)
	text_display_debug = text
	on_refresh_ipv4_debug_text.emit(text)
	on_refresh_ipv4_debug_text_array.emit(addresses)
