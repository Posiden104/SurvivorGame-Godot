extends CharacterBody2D

class_name  Player

var speed = 100.0

func _physics_process(_delta):
	set_velocity(Input.get_vector("Left", "Right", "Up", "Down").normalized() * speed)
	move_and_slide()
