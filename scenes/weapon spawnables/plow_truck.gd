extends spawnable_base


func _on_hitbox_component_body_entered(body: Node2D) -> void:
	hitbox.do_damage(body)

func _on_timer_timeout() -> void:
	despawn.emit()
	queue_free()
