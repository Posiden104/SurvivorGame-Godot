extends Node2D

func _on_player_shoot_gun(bulletScene:PackedScene, gp:Vector2):
	var b = bulletScene.instantiate()
	add_child(b)
	b.global_position = gp


