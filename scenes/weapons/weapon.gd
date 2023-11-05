extends Resource

class_name WeaponAttribute

@export var level: int
@export var isBought: bool = false
@export var isActive: bool = false
@export var cooldown: float
@export var damage: float
@export var time_bought: float
@export var weapon_name: Enums.WEAPON

func get_weapon_name() -> String:
	return Enums.WEAPON.keys()[weapon_name]

