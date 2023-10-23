extends CharacterBody2D

var player

@export var health: health_component
@export var hurtbox: hurtbox_component

var targetPos = null
@export var speed:float = 50

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	health.died.connect(_on_health_component_died)

func _physics_process(_delta):
	targetPos = player.get_position()
	var v = targetPos - position
	
	v = v.normalized() * speed
	set_velocity(v)
	move_and_slide()

func damage(_dmg:float):
	print("damage function deprecated!!")
#	health.hp -= dmg
#	if health.hp <= 0:
#		queue_free()


func _on_health_component_died():
	queue_free()
