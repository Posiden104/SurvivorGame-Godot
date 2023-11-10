extends spawnable_base

class_name spiral_bullet
var hitLimit: int = 5
var bulletLife: float = 5
var dir = Vector2.RIGHT

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(0,0)
	$Timer.wait_time = bulletLife
	$Timer.start()
	mover.dir = dir

func hitBody():
	hitLimit -= 1
	if hitLimit <= 0:
		queue_free()

func _on_timer_timeout():
	queue_free()

func _on_hitbox_component_body_entered(body):
	hitbox.do_damage(body)
	hitBody()
