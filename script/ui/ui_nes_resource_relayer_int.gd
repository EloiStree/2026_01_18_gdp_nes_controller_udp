
class_name UiNesResourceRelayerInt
extends Node

signal on_resource_relayed(resource_to_relay: NesableGameMappingInt)

@export var resource_to_relay: NesableGameMappingInt

func push_resource_to_relay():
	on_resource_relayed.emit(resource_to_relay)
