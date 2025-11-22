extends Node

class_name WhenThen

## Optional source node path (default owner signals).
@export var source_node_path: NodePath
## Whose events to connect to.
@export var event_source: EventSource
## Extracts data from the event.
@export var data_extractor: DataExtractor
## Maps the extracted data.
@export var data_mapping: DataMapping
## Behavior on the target triggered by the event.
@export var target_behavior: TargetBehavior
## Optional target node path (default parent).
@export var target_path: NodePath

var target: Node

func _ready() -> void:
	if not data_extractor:
	# Use default DataExtractor (extract nothing).
		data_extractor = DataExtractor.new()
	if not data_mapping:
	# Use default DataMapping (map nothing).
		data_mapping = DataMapping.new()
	data_mapping._ready()

	target = get_node(target_path) if target_path else get_parent()

	event_source.connect_to(self)

	target_behavior._reset(target, self)

func get_source_node() -> Node:
	if not source_node_path:
		return null
	return get_node(source_node_path)

## Event with player as parameter.
func on_player_event(player: Player) -> void:
	data_extractor.player_event(target, target_behavior, data_mapping, player)

## Basic event without parameters.
func on_event() -> void:
	data_extractor.event(target, target_behavior, data_mapping)
