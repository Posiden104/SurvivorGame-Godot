extends PanelContainer

class_name weapon_card_debug_script

var weapon: weapon_base
var weapon_manager: weapon_manager_class
@export var weapon_name: Label
@export var weapon_stats: Label

var stats_format: String = "Damage: %.2f\nCooldown: %.2fs\nIs Active: %s\nCdr %%: %.2f%%\nBonus Dmg %%: %.2f%%\nProjectile Count: %.d"

func _ready() -> void:
	calc_stats()
	MessageBus.player_level_up.connect(calc_stats)

func calc_stats():
	weapon_name.text = "%s Lv.%d" % [weapon.get_weapon_name(), weapon.level]
	var is_active: String = "true" if weapon.isActive else "false"
	var txt: String = stats_format % [weapon.damage, weapon.cooldown, is_active, weapon.cdr_percent, weapon.bonus_damage_percent, weapon.projectile_count]
	print(txt)
	weapon_stats.text = txt
	print(weapon_stats.text)

func _on_buy_button_pressed() -> void:
	weapon_manager.buy_weapon(weapon.get_weapon_name())
	calc_stats()

func _on_level_up_button_pressed() -> void:
	weapon_manager.level_up_weapon(weapon.get_weapon_name())
	calc_stats()
