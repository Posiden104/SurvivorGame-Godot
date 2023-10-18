extends CharacterBody2D

class_name  Player

const SPEED = 300.0

func _process(delta):
	pass

func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed('Right'):
		velocity.x += 1
	if Input.is_action_pressed('Left'):
		velocity.x -= 1
	if Input.is_action_pressed('Down'):
		velocity.y += 1
	if Input.is_action_pressed('Up'):
		velocity.y -= 1
		
	velocity = velocity.normalized() * SPEED
	
	move_and_slide()
