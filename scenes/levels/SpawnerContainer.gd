extends Marker2D
class_name SpawnerContainer

@export var enemies: Array[PackedScene]
@export var spawn_min_time: float = 10.0
@export var spawn_max_time: float = 20.0

var spawners: Array[Node]
@onready var spawn_timer: Timer = %SpawnTimer
var swarm_spawner
var swarm_counter: int = 25
var swarm_timer: Timer

func _ready() -> void:
	spawners = get_tree().get_nodes_in_group("spawners")
	_on_spawn_timer_timeout()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("CHEAT_Fire"):
		spawn_swarm()

func _on_spawn_timer_timeout() -> void:
	spawners.pick_random().spawn(enemies.pick_random())
	spawn_timer.wait_time = randf_range(spawn_min_time, spawn_max_time)
	spawn_timer.start()

func spawn_swarm() -> void:
	swarm_spawner = spawners.pick_random()
	swarm_timer = Timer.new()
	swarm_timer.wait_time = 0.01
	swarm_timer.autostart = true
	swarm_timer.one_shot = false
	swarm_timer.timeout.connect(swarm_timeout)
	add_child(swarm_timer)

func swarm_timeout() -> void:
	swarm_counter -= 1
	swarm_spawner.spawn(enemies[0])
	if swarm_counter <= 0:
		swarm_timer.stop()
		remove_child(swarm_timer)
		swarm_timer = null
