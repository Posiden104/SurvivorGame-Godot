extends Area2D

class_name magnetic_detector

signal magnetize
signal pickup

func _on_area_entered(area):
	if area.is_in_group("player_pickup"):
		magnetize.emit()

func _on_body_entered(body):
	if body.is_in_group("player"):
		pickup.emit()
