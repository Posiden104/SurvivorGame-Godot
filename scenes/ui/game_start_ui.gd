extends Control

func _ready() -> void:
	Engine.time_scale = 0

func _on_start_button_pressed() -> void:
	UI.start_game()
