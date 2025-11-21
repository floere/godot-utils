extends TargetBehavior

class_name VisibleTargetBehavior

## The value to set it to on event.
@export var value: bool = true
## Whether to reset it back.
@export var reset: bool = true
## Whether to initialize it to the opposite of value.
@export var initialize: bool = true

func _reset(target: Node, _node: Node) -> void:
	if initialize:
		target.visible = not value

func on_event(target: Node) -> void:
	on_float_event(target, 0.5)

func on_float_event(target: Node, duration: float) -> void:
	target.visible = value
	if reset:
		var tween = target.create_tween()
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_interval(duration)
		tween.tween_callback(func(): target.visible = not value)
