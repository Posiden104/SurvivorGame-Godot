extends Node2D

class_name bullet

@export var speed:int = 250

@export var hitbox: hitbox_component

var hitLimit: int = 1
var bulletLife: float = 10.0
var dir = Vector2.RIGHT

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Timer.wait_time = bulletLife
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += dir.normalized() * speed * delta

func hitBody():
	hitLimit -= 1
	if hitLimit <= 0:
		queue_free()

func _on_timer_timeout():
	queue_free()

func _on_hitbox_component_body_entered(body):
	hitbox.do_damage(body)
	hitBody()
