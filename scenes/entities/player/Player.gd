extends CharacterBody2D

class_name  Player

signal shoot_gun(bulletScene: PackedScene, gp: Vector2, dir: Vector2)
signal place_time_bomb(bombScene: time_bomb)

var speed = 100.0
@export var scrap_amount: int
var dir: Vector2 = Vector2.RIGHT

func _physics_process(_delta):
	set_velocity(Input.get_vector("Left", "Right", "Up", "Down").normalized() * speed)
	if velocity.length() > 0:
		dir = velocity
	move_and_slide()

func shootGun(bulletScene: bullet):
	shoot_gun.emit(bulletScene)
	
func placeTimeBomb(bomb: time_bomb):
	place_time_bomb.emit(bomb)

func increaseScrap():
	scrap_amount += 1

func pickupMagnet():
	var pickups = get_tree().get_nodes_in_group("pickups") as Array[magnetic_base]
	for p in pickups:
		p.fly_speed *= 2
		p.magnetize()

func getClosestEnemy() -> CharacterBody2D:
	var closest: CharacterBody2D
	var shortestDist: float = 2147483647.0
	var d: float
	var enemies = get_tree().get_nodes_in_group("enemies") as Array[CharacterBody2D]
	for e in enemies:
		d = (e.get_position() - global_position).length()
		if d < shortestDist:
			shortestDist = d
			closest = e
	return closest
