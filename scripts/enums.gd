extends Node

class_name enums

enum WEAPON {
	GUN,
	SWORD,
	OVERWATCH,
	TIME_BOMB
}

func get_weapon_name(w: WEAPON) -> String:
	return WEAPON.keys()[w]
