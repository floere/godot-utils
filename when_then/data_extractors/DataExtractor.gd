extends Resource

## Contains all possible event types. All map to `on_event`.
class_name DataExtractor

func event(target: Node, target_behavior: TargetBehavior, data_mapping: DataMapping) -> void:
	data_mapping.on_event(target, target_behavior)

func player_event(target: Node, target_behavior: TargetBehavior, data_mapping: DataMapping, _player: Player) -> void:
	data_mapping.on_event(target, target_behavior)
