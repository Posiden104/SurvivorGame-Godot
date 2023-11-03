extends Node2D
class_name projectile_container

func _ready() -> void:
	MessageBus.add_projectile.connect(add_child)
