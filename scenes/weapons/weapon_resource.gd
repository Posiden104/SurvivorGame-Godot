extends Resource

class_name Weapon

@export var weapon: PackedScene
@export var weapon_name: Enums.WEAPON

func get_weapon_name() -> String:
	return Enums.get_weapon_name(weapon_name)
