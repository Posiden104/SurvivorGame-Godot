extends Node2D

class_name weapon_manager_class

@export var weapon_resources: Array[Weapon]
var weapons: Array[Node2D]
var weapon_names: Array[Enums.WEAPON]

var cdr_percent: float = 1.0
var bonus_damage_percent: float = 1.0
var bonus_projectile: float = 0.0

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
			w.weapon = res
			add_child(w)
			w.buy()
			weapon_names.push_back(res.weapon_name)

func level_up_weapon(weapon_name: Enums.WEAPON):
	var w = get_weapon(weapon_name)
	if w: w.level_up()

func get_random_weapons(number_of_weapons: int) -> Array[Weapon]:
	var weps: Array[Weapon] = []
	var all_weps = weapon_resources.duplicate()
	
# Remove maxed weapons
	for w in weapon_resources:
		if w.maxed:
			all_weps.remove_at(all_weps.find(w))
	for i in number_of_weapons:
		if all_weps.is_empty():
			break
		var w = all_weps.pick_random()
		weps.push_back(w)
		all_weps.remove_at(all_weps.find(w))
	
	return weps
