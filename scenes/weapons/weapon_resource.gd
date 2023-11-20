extends Resource

class_name Weapon

@export var weapon: PackedScene
@export var weapon_name: Enums.WEAPON
@export var level_up_data: Array[weapon_level_up]

func get_weapon_name() -> String:
	return Enums.get_weapon_name(weapon_name)
