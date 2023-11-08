extends Control

@export var weapon_card_debug: PackedScene
@export var card_h_box: HBoxContainer

var player:  player_script
var weapon_manager: weapon_manager_class

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
