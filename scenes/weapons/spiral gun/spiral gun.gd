extends weapon_base

class_name spiral_gun_script
@onready var spawner: projectile_spawn_component = $projectile_spawn_component

func _ready() -> void:
	$Cooldown.timeout.connect(spawner.shoot)

func activate():
	$Cooldown.start()
