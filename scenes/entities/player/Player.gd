extends CharacterBody2D

class_name  player_script

@export var health: health_component
@export var hurtbox: hurtbox_component
@export var level_manager: level_up_component
@export var weapon_manager: weapon_manager_class

@export var speed = 100.0
var dir: Vector2 = Vector2.RIGHT

var level: int = 1

func _ready() -> void:
	Game.Player = self
	MessageBus.player_health_changed.emit(health.hp, health.max_hp)
	MessageBus.player_xp_changed.emit(level_manager.xp, level_manager.xp_to_next_level)
	weapon_manager.buy_weapon("sword")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ESCAPE"):
		health.died.emit()
	if Input.is_key_pressed(KEY_L):
		level_manager.level_up()

func _physics_process(_delta):
	set_velocity(Input.get_vector("Left", "Right", "Up", "Down").normalized() * speed)
	if velocity.length() > 0:
		dir = velocity
	move_and_slide()

func gather_scrap():
	level_manager.add_xp(1)
	MessageBus.player_xp_changed.emit(level_manager.xp)

func getClosestEnemy() -> CharacterBody2D:
	var closest: CharacterBody2D = null
	var shortestDist: float = 2147483647.0
	var d: float
	var enemies = get_tree().get_nodes_in_group("enemies") as Array[CharacterBody2D]
	for e in enemies:
		d = (e.get_position() - global_position).length()
		if d < shortestDist:
			shortestDist = d
			closest = e
	return closest


func _on_health_component_health_update(new_hp) -> void:
	MessageBus.player_health_changed.emit(new_hp)

func _on_level_up_component_level_up(_new_level) -> void:
	MessageBus.player_xp_changed.emit(level_manager.xp, level_manager.xp_to_next_level)

func _on_health_component_died() -> void:
	Game.game_over()
