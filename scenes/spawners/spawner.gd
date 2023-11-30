extends Marker2D

class_name Spawner

@export var min_spawn_time: float = 2.2
@export var max_spawn_time: float = 5.0
@export var autostart: bool = false

var scenes: Array[PackedScene]

var spawnner_scene: PackedScene

func _ready():
	if autostart:
		startTimer()

func startTimer():
	$SpawnTimer.wait_time = randf_range(min_spawn_time, max_spawn_time)
	$SpawnTimer.start()

func _on_spawn_timer_timeout():
#	spawn_random()
#	startTimer()
	pass

#func spawn_random():
#	var e = Game.Level.
#	spawn(e)

func spawn(scene: PackedScene):
	var s = scene.instantiate()
	s.global_position = global_position
	MessageBus.spawn_enemy.emit(s)
