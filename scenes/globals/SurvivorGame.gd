extends Node2D

class_name survivor_game_script

@export var UI: ui_script
@export var STATS_MANAGER: stats_manager
@export var Level: Node2D

func _ready() -> void:
	load_level_by_name("grass level/Grass_Level")
	UI.restart_game()

func restart_level() -> void:
	UI.restart_game()
	load_level_by_name("grass level/Grass_Level")

func end_level() -> void:
	for c in Level.get_children():
		c.queue_free()

func load_level_by_name(level_name: String):
	var lvl = load("res://scenes/levels/%s.tscn" % level_name) as PackedScene
	var l = lvl.instantiate()
	Level.add_child(l)

func game_over():
	UI.game_over()
	end_level()
