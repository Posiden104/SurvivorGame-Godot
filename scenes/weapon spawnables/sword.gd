extends spawnable_base

class_name sword

func set_enabled(val: bool):
	hitbox.monitoring = val
	self.visible = val

func _on_hitbox_component_body_entered(body):
	hitbox.do_damage(body)
