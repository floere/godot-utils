extends DataMapping

## Only passes on the event if below a threshold.
class_name TriggerIfBelowDataMapping

@export var threshold: float = 0.0
@export var queue_free_after_trigger: bool = false

func on_float_event(target: Node, target_behavior: TargetBehavior, value: float) -> void:
	if value <= threshold:
		target_behavior.on_float_event(target, value)
