extends Node2D

class_name level_up_component

signal LEVEL_UP(new_level: int)

@export var level: int = 0
@export var has_max: bool = false
@export var max_level: int = -1
@export var xp: int = 0
@export var xp_to_next_level: int = -1

func level_up():
	if has_max and level >= max_level:
		return
	level += 1
	LEVEL_UP.emit(level)
	
func add_xp(xp_amt: int):
	xp += xp_amt
	if xp >= xp_to_next_level and xp_to_next_level != -1:
		xp -= xp_to_next_level
		level_up()
