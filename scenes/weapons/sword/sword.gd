extends active_weapon_base

@export var swords: Array[sword]
@export var swordsActive: int = 1
@export var damage_tracker: stat_tracker_component
@export var mover: mover_base

func set_active(val: bool):
	isActive = val
	mover.enabled = val
	if swordsActive > swords.size():
		swordsActive = swords.size()
	for i in swordsActive:
		swords[i].set_enabled(val)
		swords[i].hitbox.damage = 1

func activate():
	set_active(true)

func deactivate():
	set_active(false)

func _on_sword_timer_timeout():
	deactivate()
	$Cooldown.start()

func _on_sword_cooldown_timeout():
	activate()
	$ActiveTimer.start()

func buy():
	super()
	for s in swords:
		s.hitbox.damage_dealt.connect(damage_tracker.add)
	
