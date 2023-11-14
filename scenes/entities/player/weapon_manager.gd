extends Node2D

class_name weapon_manager_class

@export var weapon_resources: Array[Weapon]
var weapons: Array[Node2D]
var weapon_names: Array[Enums.WEAPON]

var cdr_percent: float = 1.0
var bonus_damage_percent: float = 1.0
var bonus_projectile: float = 0.0


#func _ready() -> void:
#	for res in weapon_resources:
#		weapon_names.push_back(Enums.get_weapon_name(res.weapon_name).to_snake_case())
	
func get_weapon(weapon_name: Enums.WEAPON) -> weapon_base:
	var idx = weapon_names.find(weapon_name)
	if idx == -1:
		return null
	return get_child(idx)


func buy_weapon(weapon_name: Enums.WEAPON):
	if get_weapon(weapon_name):
		# Weapon already bought
		return
	for res in weapon_resources:
		if res.weapon_name == weapon_name:
			var w = res.weapon.instantiate()as weapon_base
			add_child(w)
			w.buy()
			weapon_names.push_back(res.weapon_name)
#	if w: w.buy()

func level_up_weapon(weapon_name: Enums.WEAPON):
	var w = get_weapon(weapon_name)
	if w: w.level_up()
