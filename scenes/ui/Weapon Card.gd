extends Panel

class_name weapon_card_script

signal bought

@export var is_placeholder: bool = false

var weapon: weapon_base
var weapon_name: Enums.WEAPON

@onready var weapon_name_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/WeaponName
@onready var weapon_level: Label = $"MarginContainer/VBoxContainer/HBoxContainer/Weapon Level"
@onready var weapon_stats: Label = $"MarginContainer/VBoxContainer/Weapon Stats"
@onready var button: Button = $Button

func setup(w: Weapon) -> void:
	if is_placeholder:
		setup_placeholder()
		return
	else:
		button.disabled = false
	weapon_name = w.weapon_name
	weapon_name_label.text = w.get_weapon_name()
	weapon = Game.Player.weapon_manager.get_weapon(weapon_name)
	if weapon:
		weapon_level.text = str(weapon.level + 1)
		var data = weapon.get_next_level_data()
		if data:
			weapon_stats.text = data.text
		else:
			weapon_stats.text = "Max level reached"
	else:
		weapon_level.text = "1"
		if w.level_up_data.is_empty():
			weapon_stats.text = "No Description for this weapon"
		else:
			weapon_stats.text = w.level_up_data[0].text

func setup_placeholder():
	weapon_name_label.text = ""
	weapon_level.text = ""
	weapon_stats.text = "You only have 3 choices. Sorry!"
	button.disabled = true

func _on_button_pressed() -> void:
	if weapon and weapon.isBought:
		Game.Player.weapon_manager.level_up_weapon(weapon_name)
	else:
		Game.Player.weapon_manager.buy_weapon(weapon_name)
	bought.emit()
