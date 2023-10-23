extends CharacterBody2D

var player

@export var health: health_component

var targetPos = null
@export var speed:float = 50
@export var maxHealth:float = 1
#var health:float

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
#	health = maxHealth

func _physics_process(_delta):
	targetPos = player.get_position()
	var v = targetPos - position
	
	v = v.normalized() * speed
	set_velocity(v)
	move_and_slide()

func damage(dmg:float):
	health.hp -= dmg
	if health.hp <= 0:
		queue_free()
