extends active_weapon_base

@export var swords: Array[sword]
@export var mover: mover_base

func set_active(val: bool):
	isActive = val
	mover.enabled = val
	if projectile_count > swords.size():
		projectile_count = swords.size()
	for i in projectile_count:
		swords[i].set_enabled(val)
		swords[i].hitbox.damage = 1

func activate():
	set_active(true)
	$ActiveTimer.start()

func deactivate():
	set_active(false)
	$Cooldown.start()

func _on_sword_timer_timeout():
	deactivate()

func _on_sword_cooldown_timeout():
	activate()

func buy():
	super()
	for s in swords:
		s.hitbox.damage_dealt.connect(damage_tracker.add)
	
