extends spawnable_base

class_name bullet

var hitLimit: int = 1
var bulletLife: float = 10.0
var dir = Vector2.RIGHT :
	set(value):
		dir = value
		mover.dir = value

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = bulletLife
	$Timer.start()

func hitBody():
	hitLimit -= 1
	if hitLimit <= 0:
		queue_free()

func _on_timer_timeout():
	queue_free()

func _on_hitbox_component_body_entered(body):
	hitbox.do_damage(body)
	hitBody()
