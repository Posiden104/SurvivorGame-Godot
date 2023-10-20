extends Node2D

#deg per second
@export var speed: float = 360
@export var damage: float = 5

@export var swordImages: Array[Node2D]
@export var swordsActive: int = 2
var isActive: bool = false

func enable():
	isActive = true
	if swordsActive > swordImages.size():
		swordsActive = swordImages.size()
	for i in swordsActive:
		swordImages[i].visible = true
	
func disable():
	isActive = false
	if swordsActive > swordImages.size():
		swordsActive = swordImages.size()
	for i in swordsActive:
		swordImages[i].visible = false

func _on_sword_timer_timeout():
#	%SwordImage.visible = false
	disable()
	%SwordCooldown.start()

func _on_sword_cooldown_timeout():
#	%SwordImage.visible = true
	enable()
	%SwordTimer.start()

func _process(delta):
	if isActive:
		%Sword.rotate(deg_to_rad(speed) * delta)


func _on_sword_area_body_entered(body):
	if body.is_in_group("enemies") and body.has_method("damage"):
		body.damage(damage)
