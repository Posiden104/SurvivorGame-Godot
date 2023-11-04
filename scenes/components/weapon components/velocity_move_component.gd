extends mover_base

class_name velocity_move_component

var dir = Vector2.RIGHT

func _process(delta):
	if enabled:
		get_parent().position += dir.normalized() * speed * delta
