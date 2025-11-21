extends DataMapping

## Can be given a free expression.
class_name ExpressionDataMapping

@export_multiline var formula: String

var expression: Expression = Expression.new()

func _ready() -> void:
	expression.parse(formula, ['value'])

func on_float_event(target: Node, target_behavior: TargetBehavior, value: float) -> void:
	var result = expression.execute([value], target)
	target_behavior.on_float_event(target, result)
