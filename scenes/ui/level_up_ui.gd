extends Control

class_name level_up_ui_class

@onready var weapon_card: weapon_card_script = $"MarginContainer/Panel/MarginContainer2/VBoxContainer/ButtonContainer/Weapon Card"
@onready var weapon_card_2: weapon_card_script = $"MarginContainer/Panel/MarginContainer2/VBoxContainer/ButtonContainer/Weapon Card2"
@onready var weapon_card_3: weapon_card_script = $"MarginContainer/Panel/MarginContainer2/VBoxContainer/ButtonContainer/Weapon Card3"
@onready var weapon_card_4: weapon_card_script = $"MarginContainer/Panel/MarginContainer2/VBoxContainer/ButtonContainer/Weapon Card4"
var weapon_manager: weapon_manager_class

func _ready() -> void:
	setup.call_deferred()

func setup() -> void:
	weapon_manager = Game.Player.weapon_manager

func enable():
#	var temp_wep = weapon_manager.get_random_weapon()
	var weps = weapon_manager.get_random_weapons(4)
	weapon_card.setup(weps[0])
	weapon_card_2.setup(weps[1])
	weapon_card_3.setup(weps[2])
	weapon_card_4.setup(weps[3])
	
#	weapon_card.visible = true
#	weapon_card_2.visible = true
#	weapon_card_3.visible = true
#	weapon_card_4.visible = true
	
	visible = true

func disable():
	visible = false

func _on_weapon_card_bought() -> void:
	Game.UI.resume_game()
