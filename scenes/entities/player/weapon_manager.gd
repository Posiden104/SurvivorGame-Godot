extends Node2D

class_name weapon_manager_class

@onready var weapons = get_children()

var weapon_names: Array[String]

func _ready() -> void:
	for c in weapons:
		weapon_names.push_back(c.get_weapon_name().to_snake_case())
	
func get_weapon(weapon_name: String) -> weapon_base:
	var idx = weapon_names.find(weapon_name.to_snake_case())
	if idx == -1:
		return null
	return get_child(idx)


func buy_weapon(weapon_name: String):
	var w = get_weapon(weapon_name)
	if w:
		w.buy()
