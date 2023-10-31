extends CharacterBody2D

class_name  Player

signal shoot_gun(bulletScene: PackedScene, gp: Vector2, dir: Vector2)
signal place_time_bomb(bombScene: time_bomb)

@export var health: health_component
@export var hurtbox: hurtbox_component
@export var level_manager: level_up_component

@export var speed = 100.0
var dir: Vector2 = Vector2.RIGHT

var level: int = 1

func _ready() -> void:
	Game.UI.update_health(health.hp, health.max_hp)
	Game.UI.update_xp(level_manager.xp, level_manager.xp_to_next_level)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ESCAPE"):
		health.died.emit()

func _physics_process(_delta):
	set_velocity(Input.get_vector("Left", "Right", "Up", "Down").normalized() * speed)
	if velocity.length() > 0:
		dir = velocity
	move_and_slide()

func shootGun(bulletScene: bullet):
	shoot_gun.emit(bulletScene)
	
func placeTimeBomb(bomb: time_bomb):
	place_time_bomb.emit(bomb)

func gather_scrap():
	level_manager.add_xp(1)
	Game.UI.update_xp(level_manager.xp)

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
	Game.UI.update_health(new_hp)

func _on_level_up_component_level_up(_new_level) -> void:
	Game.UI.update_xp(level_manager.xp, level_manager.xp_to_next_level)

func _on_health_component_died() -> void:
	Game.game_over()
