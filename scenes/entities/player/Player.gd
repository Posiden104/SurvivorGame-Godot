extends Entity

class_name  player_script

@export var level_manager: level_up_component
@export var weapon_manager: weapon_manager_class

@export var starting_weapon: Enums.WEAPON
@export var speed = 100.0
var dir: Vector2 = Vector2.RIGHT

func _ready() -> void:
	Game.Player = self
	
	MessageBus.player_health_changed.emit(health.hp, health.max_hp)
	MessageBus.player_xp_changed.emit(level_manager.xp, level_manager.xp_to_next_level)
	MessageBus.player_ready.emit(self)
	
	weapon_manager.buy_weapon(Enums.WEAPON.keys()[starting_weapon])

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ESCAPE"):
		health.died.emit()
	if Input.is_action_just_pressed("CHEAT_level_up"):
		level_manager.level_up()
		weapon_manager.level_up_weapon(Enums.WEAPON.keys()[starting_weapon])
	if Input.is_action_just_pressed("CHEAT_add_proj"):
		weapon_manager.get_weapon(Enums.WEAPON.keys()[starting_weapon]).projectile_count += 1

func _physics_process(_delta):
	set_velocity(Input.get_vector("Left", "Right", "Up", "Down").normalized() * speed)
	if velocity.length() > 0:
		dir = velocity
	move_and_slide()

func gather_scrap():
	level_manager.add_xp(1)
	MessageBus.player_xp_changed.emit(level_manager.xp)

func getClosestEnemy() -> Entity:
	var closest: Entity = null
	var shortestDist: float = 2147483647.0
	var d: float
	var enemies = get_tree().get_nodes_in_group("enemies") as Array[Entity]
	for e in enemies:
		d = (e.get_position() - global_position).length()
		if d < shortestDist:
			shortestDist = d
			closest = e
	return closest

func _on_health_component_health_update(old_hp, new_hp) -> void:
	if old_hp > new_hp:
		animation_player.play("hurt")
	MessageBus.player_health_changed.emit(new_hp)

func _on_level_up_component_level_up(_new_level) -> void:
	MessageBus.player_xp_changed.emit(level_manager.xp, level_manager.xp_to_next_level)
	MessageBus.player_level_up.emit()

func _on_health_component_died() -> void:
	Game.game_over()
