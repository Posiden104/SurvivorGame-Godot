extends Node2D

class_name projectile_spawn_component

@export var weapon: weapon_base
@onready var spawn_delay: Timer = $SpawnDelay

@export var projectile_scene: PackedScene
@export var spawn_on_player: bool = false
var to_spawn: int

func shoot():
	to_spawn = int(weapon.get_projectile_count())
	spawn()

func spawn():
	var projectile = projectile_scene.instantiate()
	projectile.weapon = weapon
	projectile.global_position = global_position
	projectile.hitbox.damage = weapon.get_damage()
	projectile.hitbox.damage_dealt.connect(weapon.damage_tracker.add)
	if spawn_on_player:
		MessageBus.player_spawn_object.emit(projectile)
	else:
		MessageBus.add_projectile.emit(projectile)
	to_spawn -= 1
	if to_spawn > 0:
		spawn_delay.start()

func _on_spawn_delay_timeout() -> void:
	spawn()
