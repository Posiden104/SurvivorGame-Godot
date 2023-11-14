extends Control

class_name level_up_ui_class

@onready var weapon_card: weapon_card_script = $"MarginContainer/Panel/MarginContainer2/VBoxContainer/ButtonContainer/Weapon Card"
@onready var weapon_card_2: weapon_card_script = $"MarginContainer/Panel/MarginContainer2/VBoxContainer/ButtonContainer/Weapon Card2"
@onready var weapon_card_3: weapon_card_script = $"MarginContainer/Panel/MarginContainer2/VBoxContainer/ButtonContainer/Weapon Card3"
@onready var weapon_card_4: weapon_card_script = $"MarginContainer/Panel/MarginContainer2/VBoxContainer/ButtonContainer/Weapon Card4"

func enable():
#	weapon_card.setudup(Enums.WEAPON.OVERWATCH)
	
	weapon_card.visible = true
	weapon_card_2.visible = true
	weapon_card_3.visible = true
	
	visible = true
	
func disable():
	visible = false


func _on_continue_pressed() -> void:
	Game.UI.resume_game()
