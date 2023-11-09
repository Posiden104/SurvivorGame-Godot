extends Node2D

class_name scrap_spawner_component_script

@export_range(0, 1, 0.01) var spawn_chance: float = 1.0
@onready var scrap_scene: PackedScene = preload("res://scenes/pickups/scrap.tscn")

func try_spawn():
	var pick: float = randf()
	if pick < spawn_chance:
		var s = scrap_scene.instantiate() as Node2D
		s.global_position = global_position
		MessageBus.add_scrap.emit(s)
