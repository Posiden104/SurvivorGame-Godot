extends weapon_base

class_name Grenade

@export var spawner: projectile_spawn_component


func _ready() -> void:
	super()
	accuracy = 180
	spawner.callback = spawn_callback
	
func activate():
	_on_cooldown_timeout()
	$Cooldown.start()

func spawn_callback(proj: spawnable_base) -> void:
	var selected_dir = (Game.Player as player_script).get_closest_enemy_dir().rotated(deg_to_rad(randf_range(-accuracy/2.0, accuracy/2.0)))
	proj.dir = selected_dir
	proj.mover.speed = 250
	proj.mover.speed_decay = 150


func _on_cooldown_timeout() -> void:
	spawner.shoot()
