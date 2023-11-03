extends Node2D

class_name magnetic_base

@export var fly_speed: float = 300

var isMagnetized:bool = false

func magnetize():
	isMagnetized = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isMagnetized:
		var dir = (Game.Player.global_position - global_position) as Vector2
		global_position += dir.normalized() * fly_speed * delta
