extends Node2D
class_name overwatch

@export var hitbox: hitbox_component

func set_damage(dmg: float):
	hitbox.damage = dmg
	
func do_damage(body):
	hitbox.do_damage(body)
