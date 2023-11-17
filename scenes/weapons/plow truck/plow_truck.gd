extends active_weapon_base

@export var chevron: TextureRect

var length_units = 20
var texture_size = 64

func activate():
	chevron.position.x = 0
	chevron.size.x = texture_size * length_units
#	chevron.rotation_degrees = 45
	chevron.position.x -= texture_size * length_units / 2
	chevron.visible = true
	$ActiveTimer.start()

func deactivate():
	chevron.visible = false
	$Cooldown.start()


func _on_cooldown_timeout() -> void:
	activate()


func _on_active_timer_timeout() -> void:
	deactivate()
