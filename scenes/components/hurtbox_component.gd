extends Area2D

class_name hurtbox_component

@export var health_comp: health_component
@export var invulnerable: bool = false

func can_take_damage() -> bool:
	if health_comp and not invulnerable:
		return health_comp.has_health_remaining
	return false

func take_damage(dmg: float):
	if can_take_damage():
		health_comp.damage(dmg)
