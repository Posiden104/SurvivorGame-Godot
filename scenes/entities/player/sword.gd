extends active_weapon_base

#degrees per second
@export var speed: float = 360

@export var swords: Array[Node2D]
@export var swordsActive: int = 2

func enable():
	isActive = true
	if swordsActive > swords.size():
		swordsActive = swords.size()
	for i in swordsActive:
		swords[i].visible = true
		var sword_area = swords[i].get_child(0).get_child(0) as Area2D
		sword_area.monitoring = true
	
func disable():
	isActive = false
	for i in swords.size():
		swords[i].visible = false
		var sword_area = swords[i].get_child(0).get_child(0) as Area2D
		sword_area.monitoring = false

func _on_sword_timer_timeout():
	disable()
	$Cooldown.start()

func _on_sword_cooldown_timeout():
	enable()
	$ActiveTimer.start()

func _process(delta):
	if isActive:
		rotate(deg_to_rad(speed) * delta)

func _on_sword_area_body_entered(body):
	if body.is_in_group("enemies") and body.has_method("damage"):
		body.damage(damage)
