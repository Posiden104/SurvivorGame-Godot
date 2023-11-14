extends weapon_base

class_name shotgun_script

@export var spawner: projectile_spawn_component

var spread_max_angle: float = 45.0

func _ready() -> void:
	spawner.callback = position_bullets
	spawner.set_spawn_delay(0.000001)
	projectile_count = 5

func activate():
	_on_cooldown_timeout()
	$Cooldown.start()

func position_bullets(proj: bullet):
	proj.scale = proj.scale * 0.5
	proj.mover.speed = 150
	proj.dir = Game.Player.dir.rotated(deg_to_rad(randf_range(-spread_max_angle, spread_max_angle)))

func _on_cooldown_timeout() -> void:
	spawner.shoot()
