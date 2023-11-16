extends spawnable_base

@export var aoe: aoe_damage_component_script

func _ready() -> void:
	$Timer.wait_time = weapon.projectile_bulletLife
	$Timer.start()

func _on_life_timeout() -> void:
	aoe.do_damage()
	queue_free()
