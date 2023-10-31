extends Node2D

class_name health_component

signal died
signal health_update(new_hp: float)

@export var entity_name: String

@export var max_hp: float = 100:
	set(value):
		max_hp = value
		if hp > max_hp:
			hp = max_hp

@onready var hp: float = max_hp:
	set(value):
		prev_hp = hp
		hp = clampf(value, 0, max_hp)
		health_update.emit(hp)
		if hp <= 0.0 and not has_died:
			kill()

var prev_hp: float
var has_died: bool = false
var is_damaged: bool = hp < max_hp
var has_health_remaining: bool = hp > 0

func damage(dmg: float):
	hp -= dmg

func heal(amt: float):
	damage(-amt)

func kill():
	died.emit()
	Game.STATS_MANAGER.add_death(entity_name)
