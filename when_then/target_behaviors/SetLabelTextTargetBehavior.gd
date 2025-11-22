extends TargetBehavior

class_name SetLabelTextTargetBehavior

@export var format: String = "%3.2f"

func on_float_event(target: Node, value: float) -> void:
	target.text = format % value
