

class_name UiNesResourceRelayerKeyboard
extends Node

signal on_resource_relayed(resource_to_relay: NesableGameMappingKeyboard)

@export var resource_to_relay: NesableGameMappingKeyboard

func push_resource_to_relay():
	on_resource_relayed.emit(resource_to_relay)
