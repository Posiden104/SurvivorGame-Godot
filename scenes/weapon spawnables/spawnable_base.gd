extends Node2D

class_name spawnable_base

signal despawn

@export var hitbox: hitbox_component
@export var mover: mover_base
var weapon: weapon_base

var dir = Vector2.RIGHT :
	set(value):
		dir = value
		if mover:
			mover.dir = value
