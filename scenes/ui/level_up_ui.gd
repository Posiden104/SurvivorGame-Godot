extends Control

class_name level_up_ui_class

@export var weapon_cards: Array[weapon_card_script]
var weapon_manager: weapon_manager_class

func _ready() -> void:
	setup.call_deferred()

func setup() -> void:
	weapon_manager = Game.Player.weapon_manager

func enable():
	var weps = weapon_manager.get_random_weapons(weapon_cards.size())
	for i in weapon_cards.size():
		if i < weps.size():
			weapon_cards[i].is_placeholder = false
			weapon_cards[i].setup(weps[i])
		else:
			weapon_cards[i].is_placeholder = true
			weapon_cards[i].setup_placeholder()
	
	visible = true

func disable():
	visible = false

func _on_weapon_card_bought() -> void:
	Game.UI.resume_game()
