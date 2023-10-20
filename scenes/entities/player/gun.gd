extends Node2D

@export var isActive : bool = true
@export var bullet : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(1)


func _on_timer_timeout():
	$"../..".shootGun(bullet, global_position)
