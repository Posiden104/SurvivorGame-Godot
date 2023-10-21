extends Node2D
class_name projectile_container

func _on_player_shoot_gun(bulletScene: bullet):
	add_child(bulletScene)


func _on_player_place_time_bomb(bombScene: time_bomb):
	add_child(bombScene)
