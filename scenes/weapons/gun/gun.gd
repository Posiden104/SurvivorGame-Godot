extends weapon_base

@export var shooter: projectile_spawn_component

func activate():
	shooter.callback = shoot_callback
	_on_timer_timeout()
	$Cooldown.start()

func shoot_callback(proj):
	proj.dir = Game.Player.dir

func _on_timer_timeout():
	shooter.shoot()
