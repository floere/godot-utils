extends EventSource

class_name PlayerEventSource

@export var doing: bool = false
@export var done: bool = false

func connect_to(node: Node) -> Node:
	var event_source_node = get_event_source_node(node)
	if doing:
		event_source_node.doing.connect(node.on_player_event, get_connect_flags())
	if done:
		event_source_node.done.connect(
			(func(_player): node.on_event()),
			get_connect_flags())
	return event_source_node
