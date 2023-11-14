extends Node

class_name enums

enum WEAPON {
	GUN,
	SWORD,
	OVERWATCH,
	TIME_BOMB,
	SPIRAL_GUN,
	SHOTGUN,
	GRENADE,
	PITCHFORK,
	CHAINSAW,
	BULLHORN,
	GUTS,
	ARMOR,
	PLOW_TRUCK
}

func get_weapon_name(w: WEAPON) -> String:
	return WEAPON.keys()[w]
