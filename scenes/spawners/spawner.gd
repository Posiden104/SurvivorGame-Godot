extends Marker2D

enum enemyType {slow_zombie, fast_zombie}
var slow_zombie_scene: PackedScene = preload("res://scenes/entities/enemies/zombie_slow.tscn")
var fast_zombie_scene: PackedScene = preload("res://scenes/entities/enemies/zombie_fast.tscn")


@export var enemy_type_to_spawn: enemyType
@export var min_spawn_time: float = 2.2
@export var max_spawn_time: float = 5.0
@export var autostart: bool = false

var scenes: Array[PackedScene]

var spawnner_scene: PackedScene

func _ready():
	scenes.push_back(slow_zombie_scene)
	scenes.push_back(fast_zombie_scene)
#	match enemy_type_to_spawn:
#		enemyType.slow_zombie:
#			spawnner_scene = slow_zombie_scene
#		enemyType.fast_zombie:
#			spawnner_scene = fast_zombie_scene
	if autostart:
		startTimer()

func startTimer():
	$SpawnTimer.wait_time = randf_range(min_spawn_time, max_spawn_time)
	$SpawnTimer.start()

func _on_spawn_timer_timeout():
	var e = scenes.pick_random().instantiate()
	e.global_position = global_position
	MessageBus.spawn_enemy.emit(e)
	startTimer()
	
