extends EventSource

class_name ExampleEventSource

@export var doing: bool = false
@export var did: bool = false

func connect_to(node: Node) -> Node:
	var event_source_node = get_event_source_node(node)
	if doing:
		event_source_node.doing.connect(
			(func(player, _thing, _other):
				node.on_player_event(player)), get_connect_flags())
	if did:
		event_source_node.did.connect(node.on_event, get_connect_flags())
	return event_source_node
