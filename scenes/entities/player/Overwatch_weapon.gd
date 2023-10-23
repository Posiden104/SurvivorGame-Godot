extends active_weapon_base

var target: CharacterBody2D
@onready var player: Player = $"../.."
var scale_max: float = 0.05
var scale_min: float = 0.025

@export var crosshair: overwatch

func _ready():
	super()
	crosshair.scale = Vector2(scale_max, scale_max)

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
	crosshair.hitbox.damage = damage
	if acquire_target():
		isActive = true
		crosshair.global_position = target.global_position
		crosshair.visible = true
		$ActiveTimer.start()
	else:
		print("overwatch - target fail")
		$ActiveTimer.stop()
		$Cooldown.stop()
		$TargetFailTimer.start()
	
func acquire_target() -> bool:
	target = player.getClosestEnemy()
	return target != null
	
func deactivate():
	isActive = false
	crosshair.visible = false
	$Cooldown.start()

func _on_cooldown_timeout():
	activate()

func _on_active_timer_timeout():
	deactivate()
	crosshair.do_damage(target)

func _on_target_fail_timer_timeout():
	activate()
