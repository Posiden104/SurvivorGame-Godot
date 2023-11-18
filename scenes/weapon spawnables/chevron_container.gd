extends spawnable_base

@onready var chevron: TextureRect = $Chevron
@onready var timer: Timer = $Timer
@onready var truck_spawn: Marker2D = $"Chevron/Truck Spawn"

@export var spawner: projectile_spawn_component

var sprite_width = 64
var length = sprite_width * 25

func _ready() -> void:
	spawner.weapon = weapon
	spawner.callback = position_truck
	var rect = get_viewport().get_visible_rect().size
	var pos = Game.Player.global_position
	pos = Vector2(pos.x + randf_range(-rect.x / 4, rect.x / 4), pos.y + randf_range(-rect.y / 4, rect.y / 4))
	global_position = pos
	rotation_degrees = randf_range(0, 360)
	chevron.size.x = length
	chevron.position.x -= length / 2.0
	chevron.visible = true
	timer.start()

func position_truck(truck: spawnable_base):
	truck.global_position = truck_spawn.global_position
	truck.dir = Vector2.RIGHT.rotated(rotation)
	truck.rotation = rotation
	truck.despawn.connect(queue_free)
	
func _on_timer_timeout() -> void:
	spawner.shoot()
