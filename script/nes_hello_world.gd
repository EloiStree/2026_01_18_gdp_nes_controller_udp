# I am a game element in the scene
extends Node

@export var ui_label_to_use :Label 

# When the game start I do something
func _ready() -> void:
	# void = I dont need to give something back
	# send a text in the console debugger
	print("Hello World")
	ui_label_to_use.text ="Hello World"
	
