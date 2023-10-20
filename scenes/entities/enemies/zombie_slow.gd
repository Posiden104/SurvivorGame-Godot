extends CharacterBody2D

var player

var targetPos = null
var speed = 50
var health = 1
var maxHealth = 1

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]

func _physics_process(_delta):
	targetPos = player.get_position()
	var v = targetPos - position
	
	v = v.normalized() * speed
	set_velocity(v)
	move_and_slide()

func damage(dmg):
	health -= dmg
	if health <= 0:
		queue_free()
