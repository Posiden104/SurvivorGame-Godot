extends Control

@export var weapon_card_debug: PackedScene
@export var card_h_box: HBoxContainer
@export var globals_card_label: Label

var player:  player_script
var weapon_manager: weapon_manager_class
var globals_format = "Cdr %%: %.2f%%\nBonus Dmg %%: %.2f%%\nBonus Proj.: %d"

func _ready() -> void:
	MessageBus.player_ready.connect(startup)
	
func startup(p: player_script):
	player = p
	weapon_manager = player.weapon_manager as weapon_manager_class
	for wep in weapon_manager.weapons as Array[weapon_base]:
		var card = weapon_card_debug.instantiate() as weapon_card_debug_script
		card.weapon = wep
		card.weapon_manager = weapon_manager
		card_h_box.add_child(card)
	calc_globals()
	MessageBus.global_bonus_changed.connect(calc_globals)


func calc_globals():
	globals_card_label.text = globals_format % [weapon_manager.cdr_percent, weapon_manager.bonus_damage_percent, weapon_manager.bonus_projectile]


func _on_cdr_button_pressed() -> void:
	player.weapon_manager.cdr_percent += 0.01
	calc_globals()


func _on_dmg_button_pressed() -> void:
	player.weapon_manager.bonus_damage_percent += 0.01
	calc_globals()

func _on_proj_button_pressed() -> void:
	player.weapon_manager.bonus_projectile += 1.0
	calc_globals()
