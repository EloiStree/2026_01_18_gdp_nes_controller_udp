# This class avoid the need to by hand link all the signal of integer request in the children.
class_name NesRelayButtonS2wIntDownUp extends Node
signal on_integer_requested(integer_relayed:int)

@export var parent_note_to_overwatch:Array[Node]

@export_group("For Debugging")
@export var all_texture_s2w_found :Array[NesTextureButtonPlusToS2wIntDownUpBool]
@export var last_relayed_value:int

func _find_all_texture_button_in_nodes(nodes: Array[Node]) -> Array[NesTextureButtonPlusToS2wIntDownUpBool]:
	var result: Array[NesTextureButtonPlusToS2wIntDownUpBool] = []
	# use of recursivity
	for node in nodes:
		if node is NesTextureButtonPlusToS2wIntDownUpBool:
			result.append(node)
		if node.get_child_count() > 0:
			result.append_array(
				_find_all_texture_button_in_nodes(node.get_children())
			)
	return result

func _ready() -> void:
	# Look in the children of the node given for texture s2w button
	var buttons :Array[NesTextureButtonPlusToS2wIntDownUpBool]= _find_all_texture_button_in_nodes(parent_note_to_overwatch)
	all_texture_s2w_found  =buttons
	for button in buttons:
		button.on_request_int_action.connect(_relay_integer)

func _relay_integer(value_to_relay:int):
	on_integer_requested.emit(value_to_relay)
	last_relayed_value =value_to_relay
	
	
	
