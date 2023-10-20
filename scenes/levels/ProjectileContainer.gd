extends Node2D

func _on_player_shoot_gun(bulletScene:PackedScene, global_position:Vector2):
	var b = bulletScene.instantiate()
	add_child(b)
	b.global_position = global_position


