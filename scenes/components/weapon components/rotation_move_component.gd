extends mover_base

class_name rotation_move_component

# speed (mover_base) in degrees per second

func _process(delta: float) -> void:
	if enabled:
		get_parent().rotate(deg_to_rad(speed) * delta)


