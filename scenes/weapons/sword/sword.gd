extends active_weapon_base

@export var swords: Array[sword]
@export var mover: mover_base

func set_active(val: bool):
	isActive = val
	mover.enabled = val
	var num_swords = min(swords.size(), int(get_projectile_count()))
	for i in num_swords:
		swords[i].set_enabled(val)
		swords[i].hitbox.damage = get_damage()

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
	
