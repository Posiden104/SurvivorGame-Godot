extends Node2D

class_name projectile_spawn_component

signal spawned(projectile)

@export var weapon: weapon_base
@onready var spawn_delay: Timer = $SpawnDelay

@export var projectile_scene: PackedScene
@export var connect_to_weapon: bool = false
var to_spawn: int
var callback: Callable

func set_spawn_delay(time: float):
	spawn_delay.wait_time = time

func shoot(has_hitbox: bool = true):
	to_spawn = int(weapon.get_projectile_count())
	_spawn(has_hitbox)

func _spawn(has_hitbox: bool = true):
	var projectile = projectile_scene.instantiate()
	projectile.weapon = weapon
	projectile.global_position = global_position
	if has_hitbox:
		projectile.hitbox.damage = weapon.get_damage()
		projectile.hitbox.damage_dealt.connect(weapon.damage_tracker.add)
	if callback:
		callback.call(projectile)
	if connect_to_weapon:
		spawned.emit(projectile)
	else:
		MessageBus.add_projectile.emit(projectile)
	to_spawn -= 1
	if to_spawn > 0:
		spawn_delay.start()

func _on_spawn_delay_timeout() -> void:
	_spawn()
