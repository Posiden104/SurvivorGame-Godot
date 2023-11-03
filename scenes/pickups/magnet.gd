extends magnetic_base

func _on_magnetic_component_magnetize() -> void:
	magnetize()

func _on_magnetic_component_pickup() -> void:
	var pickups = get_tree().get_nodes_in_group("pickups") as Array[magnetic_base]
	for p in pickups:
		p.fly_speed *= 2
		p.magnetize()
	queue_free()
