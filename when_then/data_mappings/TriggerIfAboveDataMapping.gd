extends DataMapping

## Only passes on the event if above a threshold.
class_name TriggerIfAboveDataMapping

@export var threshold: float = 0.0

func on_float_event(target: Node, target_behavior: TargetBehavior, value: float) -> void:
	if value >= threshold:
		target_behavior.on_float_event(target, value)
