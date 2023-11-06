extends weapon_base

class_name time_bomb

@export var fuse_time: float = 5
@export var shooter: projectile_spawn_component

func activate():
	shooter.shoot()
	$Cooldown.start()

func _on_bomb_cooldown_timer_timeout():
	activate()
