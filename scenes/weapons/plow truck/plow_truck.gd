extends weapon_base

@export var spawner: projectile_spawn_component

func activate():
	_on_cooldown_timeout()
	$Cooldown.start()

func _on_cooldown_timeout() -> void:
	spawner.shoot(false)
