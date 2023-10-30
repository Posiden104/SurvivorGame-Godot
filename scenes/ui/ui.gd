extends CanvasLayer

@export var game_start_ui : Control
@export var game_ui : Control


func start_game():
	game_start_ui.visible = false
	game_ui.visible = true
	game_ui.start_clock()
	Engine.time_scale = 1

func update_health(hp: float, max_hp = null):
	game_ui.update_health(hp, max_hp)

func update_xp(xp: float, max_xp = null):
	game_ui.update_xp(xp, max_xp)
