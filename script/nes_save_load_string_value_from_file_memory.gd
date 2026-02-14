class_name NesSaveLoadStringValueFromFileMemory 
extends Node

signal on_value_loaded_from_file(text:String)

@export var save_mode: SaveType = SaveType.FILE
@export var save_unique_id: String  #You need to find a unique name to call it.
@export var default_if_not_set: String = "" # What if it is the first time or empty

enum SaveType {
	CONFIG, #manage by godot
	FILE #manage as file by developer
}


func _ready():
	load_text()
	


func load_text()-> String:
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
			if FileAccess.file_exists(path):
				var file = FileAccess.open(path, FileAccess.READ)
				loaded_text = file.get_as_text()
				file.close()
			else:
				loaded_text = default_if_not_set
	on_value_loaded_from_file.emit( loaded_text)
	return loaded_text


func set_unique_id(id:String):
	save_unique_id =id

func save_given_float(value:float):
	save_given_text(str(value))
	
func save_given_integer(value:int):
	save_given_text(str(value))

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

	
