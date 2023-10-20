extends CharacterBody2D

class_name  Player

signal shoot_gun(bulletScene: PackedScene, global_position: Vector2)

var speed = 100.0
@export var scrap_amount: int

func _physics_process(_delta):
	set_velocity(Input.get_vector("Left", "Right", "Up", "Down").normalized() * speed)
	move_and_slide()

func shootGun(bulletScene: PackedScene):
	shoot_gun.emit(bulletScene, global_position)

func increaseScrap():
	scrap_amount += 1
