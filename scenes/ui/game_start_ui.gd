extends Control

class_name game_start_ui_class

func enable() -> void:
	visible = true

func disable() -> void:
	visible = false

func _on_start_button_pressed() -> void:
	Game.UI.start_game()
