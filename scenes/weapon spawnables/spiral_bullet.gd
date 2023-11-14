extends spawnable_base

class_name spiral_bullet

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(0,0)
	$Timer.wait_time = weapon.projectile_bulletLife
	$Timer.start()

func hitBody():
	weapon.projectile_hitLimit -= 1
	if weapon.projectile_hitLimit <= 0:
		queue_free()

func _on_timer_timeout():
	queue_free()

func _on_hitbox_component_body_entered(body):
	hitbox.do_damage(body)
	hitBody()
