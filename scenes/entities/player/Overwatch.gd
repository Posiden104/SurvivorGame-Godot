extends active_weapon_base

var target: CharacterBody2D
@onready var player: Player = $"../.."
var scale_max: float = 0.03
var scale_min: float = 0.009

func _process(_delta):
	if isActive:
		if target == null:
			$TargetFailTimer.start()
			isActive = false
		else:
			$OverwatchImage.global_position = target.global_position
			var scaleVal = lerpf(scale_max, scale_min, 1-($ActiveTimer.get_time_left()/cooldown))
			$OverwatchImage.scale = Vector2(scaleVal, scaleVal)
			

func activate():
	if acquire_target():
		isActive = true
		$OverwatchImage.global_position = target.global_position
		$OverwatchImage.visible = true
		$ActiveTimer.start()
	else:
		print("target failed")
		$ActiveTimer.stop()
		$Cooldown.stop()
		$TargetFailTimer.start()
	
func acquire_target() -> bool:
	target = player.getClosestEnemy()
	return target != null
	
func deactivate():
	isActive = false
	$OverwatchImage.visible = false
	$Cooldown.start()

func _on_cooldown_timeout():
	activate()

func _on_active_timer_timeout():
	deactivate()
	if "damage" in target:
		target.damage(damage)


func _on_target_fail_timer_timeout():
	activate()
