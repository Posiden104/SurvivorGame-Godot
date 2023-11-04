extends Node2D
class_name time_bomb

var fuse_time: float
var enemies: Array[CharacterBody2D]
@export var aoe_damage: aoe_damage_component_script
@export var hitbox: hitbox_component

func _ready():
	$TimeBombTimer.wait_time = fuse_time
	$TimeBombTimer.start()

func _on_time_bomb_timer_timeout():
	aoe_damage.do_damage()
	queue_free()
