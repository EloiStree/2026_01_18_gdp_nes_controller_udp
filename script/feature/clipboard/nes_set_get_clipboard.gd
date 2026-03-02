class_name NesSetGetClipboard
extends Node


signal on_clipboard_fetched(text:String)
signal on_clipboard_fetched_changed(text:String)

@export var last_fetch_clipboard:String
@export var fetch_every_seconds_clipboard:bool =true

func _ready() -> void:
	while true:
		await get_tree().create_timer(1).timeout
		if fetch_every_seconds_clipboard:
			fetch_and_emit_clipboard()

func fetch_and_emit_clipboard():
	var new_text = get_clipboard_text()
	if new_text != last_fetch_clipboard:
		on_clipboard_fetched_changed.emit(new_text)
	on_clipboard_fetched.emit(new_text)
	last_fetch_clipboard = new_text
	
func get_clipboard_text()->String: 
	return DisplayServer.clipboard_get()
	
func set_clipboard_text(text:String): 
	DisplayServer.clipboard_get()
	
