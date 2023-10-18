extends CharacterBody2D

class_name  Player

var speed = 5000.0

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
		
	velocity = velocity.normalized() * speed * delta
	
	move_and_slide()
