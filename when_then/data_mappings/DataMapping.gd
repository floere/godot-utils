extends Resource

## "Maps" all possible event types 1:1.
class_name DataMapping

func _ready() -> void:
	pass

func on_event(target: Node, target_behavior: TargetBehavior) -> void:
	target_behavior.on_event(target)

func on_player_event(target: Node, target_behavior: TargetBehavior, player: Player) -> void:
	target_behavior.on_player_event(target, player)

func on_float_event(target: Node, target_behavior: TargetBehavior, value: float) -> void:
	target_behavior.on_float_event(target, value)
