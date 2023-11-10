extends weapon_base

class_name spiral_gun_script
@export var spawner: projectile_spawn_component
@onready var container: Node2D = $"Projectile Container"

func _ready() -> void:
	$Cooldown.timeout.connect(spawner.shoot)
	spawner.spawned.connect(container.add_child)

func activate():
	$Cooldown.start()
