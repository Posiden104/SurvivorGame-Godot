extends Marker2D
class_name enemy_container

func _ready() -> void:
	MessageBus.spawn_enemy.connect(add_child)
