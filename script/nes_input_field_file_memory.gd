

class_name NesInputFieldFileMemory 
extends Node

@export var input_field:LineEdit
@export var save_mode: SaveType = SaveType.FILE
@export var save_event_type: SaveEventType = SaveEventType.AT_CHANGED
@export var save_unique_id: String  #You need to find a unique name to call it.

@export var default_if_not_set: String = "" # What if it is the first time or empty

@export var use_print_of_save_path :bool

enum SaveType {
	CONFIG, #manage by godot
	FILE #manage as file by developer
}

enum SaveEventType{
	AT_CHANGED, #When line change
	AT_SUBMIT #When user leave or press enter

}

func _ready():
	if input_field == null:
		return
	load_text()
	
	if save_event_type == SaveEventType.AT_CHANGED:
		input_field.text_changed.connect(save_given_text)
	if save_event_type == SaveEventType.AT_SUBMIT:
		input_field.text_submitted.connect(save_given_text)
	


func _exit_tree():
	if input_field == null:
		return
	save_text_in_input_field()


func load_text():
	var loaded_text := ""

	match save_mode:
		SaveType.CONFIG:
			var config = ConfigFile.new()
			var err = config.load("user://save_data.cfg")

			if err == OK:
				loaded_text = config.get_value("TextFields", save_unique_id, default_if_not_set)
			else:
				loaded_text = default_if_not_set

		SaveType.FILE:
			var path = "user://%s.txt" % save_unique_id
			if use_print_of_save_path:
				print("Save PATH",path)
			if FileAccess.file_exists(path):
				var file = FileAccess.open(path, FileAccess.READ)
				loaded_text = file.get_as_text()
				file.close()
			else:
				loaded_text = default_if_not_set
	# print("Loaded Text",loaded_text)
	input_field.text = loaded_text
	# I dont like it... That bad.. But it should work
	input_field.text_changed.emit(loaded_text)


func save_given_text(text:String):
	var text_to_save :=  text
	# print("Saving Text",text_to_save)
	match save_mode:
		SaveType.CONFIG:
			var config = ConfigFile.new()
			config.load("user://save_data.cfg") # ignore errors
			config.set_value("TextFields", save_unique_id, text_to_save)
			config.save("user://save_data.cfg")

		SaveType.FILE:
			var path = "user://%s.txt" % save_unique_id
			var file = FileAccess.open(path, FileAccess.WRITE)
			file.store_string(text_to_save)
			file.close()
	# print("Saved Text",text_to_save)

func save_text_in_input_field():
	var text_to_save := input_field.text
	save_given_text(text_to_save)
	
