extends PanelContainer

class_name weapon_card_debug_script

var weapon: weapon_base
var weapon_manager: weapon_manager_class
@export var weapon_name: Label
@export var weapon_stats: Label
@export var action_btn: Button

var stats_format: String = "Damage: %.2f\nCooldown: %.2fs\nIs Active: %s\nProjectile Count: %.d\nCdr %%: %.2f%%\nBonus Dmg %%: %.2f%%"

func _ready() -> void:
	if weapon.isBought:
		action_btn.text = "Level Up"
	calc_stats()
	MessageBus.player_level_up.connect(calc_stats)

func calc_stats():
	weapon_name.text = "%s Lv.%d" % [weapon.get_weapon_name(), weapon.level]
	var is_active: String = "true" if weapon.isActive else "false"
	var txt: String = stats_format % [weapon.damage, weapon.cooldown, is_active, weapon.projectile_count, weapon.cdr_percent, weapon.bonus_damage_percent]
	weapon_stats.text = txt
	if weapon.maxed && weapon.isBought:
		action_btn.disabled = true
		action_btn.text = "Max Level"

func _on_action_button_pressed() -> void:
	if weapon.isBought:
		weapon_manager.level_up_weapon(weapon.get_weapon_name())
	else:
		weapon_manager.buy_weapon(weapon.get_weapon_name())
		action_btn.text = "Level Up"
	calc_stats()
