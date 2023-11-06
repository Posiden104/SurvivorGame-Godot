extends spawnable_base
class_name time_bomb_spawnable

var fuse_time: float
var enemies: Array[CharacterBody2D]
@export var aoe_damage: aoe_damage_component_script

func _ready():
	var tb = weapon as time_bomb
	$TimeBombTimer.wait_time = tb.fuse_time
	$TimeBombTimer.start()

func _on_time_bomb_timer_timeout():
	aoe_damage.do_damage()
	queue_free()
