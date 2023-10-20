extends magnetic_base

func _ready():
	player = get_tree().get_nodes_in_group("player")[0] as Player

func _on_magnet_area_magnetize():
	magnetize()

func _on_magnet_area_pickup():
	player.pickupMagnet()
	queue_free()
