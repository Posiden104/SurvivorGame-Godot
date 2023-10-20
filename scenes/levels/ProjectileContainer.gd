extends Node2D

func _on_player_shoot_gun(bulletScene:PackedScene, gp:Vector2, dir:Vector2):
	var b = bulletScene.instantiate() as bullet
	add_child(b)
	b.dir = dir
	b.global_position = gp


