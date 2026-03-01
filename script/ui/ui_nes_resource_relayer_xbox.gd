

class_name UiNesResourceRelayerXbox
extends Node

signal on_resource_relayed(resource_to_relay: NesableGameMappingXboxBasic)

@export var resource_to_relay: NesableGameMappingXboxBasic

func push_resource_to_relay():
	on_resource_relayed.emit(resource_to_relay)
