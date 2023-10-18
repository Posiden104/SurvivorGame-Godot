extends Node2D

@export var speed:int = 5
var damage = 1
var hitLimit:int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x += speed

func hitBody():
	hitLimit -= 1
	if hitLimit <= 0:
		queue_free()

func _on_area_area_entered(area):
	print("Oh! I hit an area!")

func _on_area_body_entered(body):
	if not body.is_in_group("player") and body.has_method("damage"):
		body.damage(damage)
		hitBody()