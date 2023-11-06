extends Panel

class_name weapon_card_script

@export var weapon: weapon_base
@onready var weapon_name: Label = $MarginContainer/VBoxContainer/HBoxContainer/WeaponName
@onready var weapon_level: Label = $"MarginContainer/VBoxContainer/HBoxContainer/Weapon Level"
@onready var weapon_stats: Label = $"MarginContainer/VBoxContainer/Weapon Stats"

func setup(w: Enums.WEAPON) -> void:
	weapon = Game.Player.weapon_manager.get_weapon(Enums.get_weapon_name(w))
	weapon_name.text = weapon.get_weapon_name()
	weapon_level.text = str(weapon.level + 1)
	var data = weapon.get_next_level_data()
	if data:
		weapon_stats.text = data.text
	else:
		weapon_stats.text = "Max level reached"
