extends Area2D
class_name hitbox_component

@export var damage: float

func do_damage(body):
	for c in body.get_children():
		if c is health_component:
			c.damage(damage)
