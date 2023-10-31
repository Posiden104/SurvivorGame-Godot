extends Control

class_name game_over_restart_ui_class

func enable() -> void:
	visible = true

func disable() -> void:
	visible = false

func _on_restart_button_pressed() -> void:
	Game.restart_level()

func _on_quit_button_pressed() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
