
extends Node
class_name ToggleNodeNesXboxEvent

signal on_toggle_nes(set_as_on:bool)
signal on_toggle_xbox(set_as_on:bool)

@export var nodes_nes:Array[Node]
@export var nodes_xbox:Array[Node]
@export var toggle_state:ToggleNesXbox = ToggleNesXbox.NES

enum ToggleNesXbox {
	NES,
	XBOX
}

func _ready():
	set_toggle_state(toggle_state)

func set_toggle_state_with_boolean_to_nes(is_nes:bool):
	if is_nes:
		set_toggle_state(ToggleNesXbox.NES)
	else:
		set_toggle_state(ToggleNesXbox.XBOX)
func set_toggle_state_with_boolean_to_xbox(is_xbox:bool):
	if is_xbox:
		set_toggle_state(ToggleNesXbox.XBOX)
	else:
		set_toggle_state(ToggleNesXbox.NES)

func set_toggle_state_to_nes():
	set_toggle_state(ToggleNesXbox.NES)

func set_toggle_state_to_xbox():
	set_toggle_state(ToggleNesXbox.XBOX)

func set_toggle_state(new_state:ToggleNesXbox):
	toggle_state = new_state
	if toggle_state == ToggleNesXbox.NES:
		for node in nodes_nes:
			if node==null:
				continue
			node.visible = true
		for node in nodes_xbox:
			if node==null:
				continue
			node.visible = false
		emit_signal("on_toggle_nes", true)
		emit_signal("on_toggle_xbox", false)
	else:
		for node in nodes_nes:
			if node==null:
				continue
			node.visible = false
		for node in nodes_xbox:
			if node==null:
				continue
			node.visible = true
		emit_signal("on_toggle_xbox", true)
		emit_signal("on_toggle_nes", false) 


func toggle_nes_xbox():
	if toggle_state == ToggleNesXbox.NES:
		set_toggle_state(ToggleNesXbox.XBOX)
	else:
		set_toggle_state(ToggleNesXbox.NES)
