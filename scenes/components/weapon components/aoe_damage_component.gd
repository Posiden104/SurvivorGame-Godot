extends Node2D

class_name aoe_damage_component_script

var enemies: Array[CharacterBody2D]
@export var hitbox: hitbox_component

func _ready() -> void:
	hitbox.body_entered.connect(_on_hitbox_component_body_entered)
	hitbox.body_exited.connect(_on_hitbox_component_body_exited)

func do_damage():
	for e in enemies:
		hitbox.do_damage(e)

func _on_hitbox_component_body_entered(body):
	if body.is_in_group("enemies"):
		enemies.push_back(body)

func _on_hitbox_component_body_exited(body):
	var i = enemies.find(body)
	if i >= 0:
		enemies.remove_at(i)
