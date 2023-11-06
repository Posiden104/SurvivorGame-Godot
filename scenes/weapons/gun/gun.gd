extends weapon_base

@export var shooter: projectile_spawn_component

func activate():
	_on_timer_timeout()
	$Cooldown.start()

func _on_timer_timeout():
	shooter.shoot()
