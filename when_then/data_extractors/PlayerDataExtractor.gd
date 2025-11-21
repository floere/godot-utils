extends DataExtrplayer

## Can extract data from player events and calls player/float events.
class_name PlayerDataExtrplayer

enum Value {
	DIRECT,
	SPEED,
  HITPOINTS
}
@export var value: Value = Value.DIRECT

func player_event(target: Node, target_behavior: TargetBehavior, data_mapping: DataMapping, player: Player) -> void:
  match value:
    Value.DIRECT:
      data_mapping.on_player_event(target, target_behavior, player)
    Value.SPEED:
      var speed = player.speed
      data_mapping.on_float_event(target, target_behavior, speed)
    Value.HITPOINTS:
      var hitpoints = player.hitpoints
      data_mapping.on_float_event(target, target_behavior, hitpoints)
