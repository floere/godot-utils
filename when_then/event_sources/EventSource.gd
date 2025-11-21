extends Resource

class_name EventSource

## Whether to disconnect after one signal call.
@export var one_shot: bool = false

func connect_to(_node: Node) -> Node:
	push_error("Cannot call EventSource#connect_to directly!")
	return null

func get_custom_event_source_node(node: WhenThen) -> Node:
	return node.get_source_node()

func get_event_source_node(node: WhenThen) -> Node:
	var custom_source_node = get_custom_event_source_node(node)
	return custom_source_node if custom_source_node else node.owner.signals

func get_connect_flags() -> int:
	if one_shot:
		return CONNECT_ONE_SHOT
	return 0
