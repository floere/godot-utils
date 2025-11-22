extends Node2D

class_name Player

signal doing(player: Player)
signal done(player: Player)

var speed: float = -50

func _ready() -> void:
	var tween = create_tween()
	tween.set_loops()
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(self, "speed", 100.0, 1.0)
	tween.tween_property(self, "speed", -100.0, 1.0)

func _process(_delta: float) -> void:
	doing.emit(self)
	done.emit(self)

func _physics_process(delta: float) -> void:
	self.position.x += speed * delta
