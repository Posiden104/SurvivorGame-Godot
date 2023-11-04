extends Node2D

class_name sword

@export var hitbox: hitbox_component

func set_enabled(val: bool):
	hitbox.monitoring = val
	self.visible = val

func _on_hitbox_component_body_entered(body):
	hitbox.do_damage(body)
