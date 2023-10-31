extends Area2D

class_name hurtbox_component

@export var health_comp: health_component

func can_take_damage() -> bool:
	if health_comp:
		return health_comp.has_health_remaining
	return false

func take_damage(dmg: float):
	if can_take_damage() and health_comp:
			health_comp.damage(dmg)
