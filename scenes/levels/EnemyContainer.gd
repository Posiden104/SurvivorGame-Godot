extends Marker2D
class_name enemy_container

func _on_spawner_spawn(enemyScene:PackedScene, location:Vector2):
	var e = enemyScene.instantiate()
	add_child(e)
	e.global_position = location
