extends active_weapon_base

#degrees per second
@export var speed: float = 360

@export var swords: Array[sword]
@export var swordsActive: int = 1

func set_active(val: bool):
	isActive = val
	if swordsActive > swords.size():
		swordsActive = swords.size()
	for i in swordsActive:
		swords[i].set_enabled(val)
		swords[i].hitbox.damage = 1

func _on_sword_timer_timeout():
	set_active(false)
	$Cooldown.start()

func _on_sword_cooldown_timeout():
	set_active(true)
	$ActiveTimer.start()

func _process(delta):
	if isActive:
		rotate(deg_to_rad(speed) * delta)
