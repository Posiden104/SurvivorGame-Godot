extends Marker2D

enum enemyType {slow_zombie}
var slow_zombie_scene: PackedScene = preload("res://scenes/entities/enemies/zombie_slow.tscn")


@export var enemy_type_to_spawn: enemyType
@export var min_spawn_time: float = 2.2
@export var max_spawn_time: float = 5.0
@export var autostart: bool = false

signal spawn(enemyScene: PackedScene, location: Vector2)
var spawnner_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	match enemy_type_to_spawn:
		enemyType.slow_zombie:
			spawnner_scene = slow_zombie_scene
	if autostart:
		startTimer()

func startTimer():
	$SpawnTimer.wait_time = randf_range(min_spawn_time, max_spawn_time)
	$SpawnTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	spawn.emit(spawnner_scene, global_position)
	startTimer()
	
