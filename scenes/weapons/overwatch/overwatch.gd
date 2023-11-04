extends active_weapon_base

var target: CharacterBody2D
var scale_max: float = 0.05
var scale_min: float = 0.025

@export var damage_tracker: stat_tracker_component
@export var crosshair: Node2D
@export var hitbox: hitbox_component # hitbox collision shape not used

func _ready():
	super()
	crosshair.scale = Vector2(scale_max, scale_max)
	hitbox.damage_dealt.connect(damage_tracker.add)

func _process(_delta):
	if isActive:
		if target == null:
			$TargetFailTimer.start()
			isActive = false
		else:
			crosshair.global_position = target.global_position
			var scaleVal = clampf(lerpf(scale_max, scale_min, 1-($ActiveTimer.get_time_left()/cooldown)), scale_min, scale_max)
			crosshair.scale = Vector2(scaleVal, scaleVal)

func activate():
	hitbox.damage = damage
	if acquire_target():
		isActive = true
		crosshair.global_position = target.global_position
		crosshair.visible = true
		$ActiveTimer.start()
	else:
#		print("overwatch - target fail")
		$ActiveTimer.stop()
		$Cooldown.stop()
		$TargetFailTimer.start()
	
func acquire_target() -> bool:
	target = Game.Player.getClosestEnemy()
	return target != null
	
func deactivate():
	isActive = false
	crosshair.visible = false
	$Cooldown.start()

func _on_cooldown_timeout():
	activate()

func _on_active_timer_timeout():
	deactivate()
	hitbox.do_damage(target)

func _on_target_fail_timer_timeout():
	activate()
