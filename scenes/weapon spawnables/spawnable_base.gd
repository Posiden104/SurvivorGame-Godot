extends Node2D

class_name spawnable_base

@export var hitbox: hitbox_component
@export var mover: mover_base
var weapon: weapon_base

var dir = Vector2.RIGHT :
	set(value):
		dir = value
		mover.dir = value
