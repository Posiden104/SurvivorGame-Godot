extends Node2D
class_name time_bomb

var fuse_time: float
var enemies: Array[CharacterBody2D]
@export var hitbox: hitbox_component

func _ready():
	$TimeBombTimer.wait_time = fuse_time
	$TimeBombTimer.start()

func _on_time_bomb_timer_timeout():
	for e in enemies:
		hitbox.do_damage(e)
	queue_free()

func _on_hitbox_component_body_entered(body):
	if body.is_in_group("enemies"):
		enemies.push_back(body)

func _on_hitbox_component_body_exited(body):
	var i = enemies.find(body)
	if i >= 0:
		enemies.remove_at(i)
