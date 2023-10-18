extends RigidBody2D

var player

var targetPos = null
var speed = 50
var health = 1
var maxHealth = 1

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]

func _process(delta):
	pass

func _physics_process(delta):
	targetPos = player.get_position()
	var velocity = targetPos - position
	
	velocity = velocity.normalized() * speed

	set_linear_velocity(velocity)

func _on_body_entered(body):
	print("Something hit me")
	
func damage(damage):
	health -= damage
	if health <= 0:
		queue_free()
