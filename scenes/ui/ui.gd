extends CanvasLayer

class_name ui_script

@export var game_start_ui : game_start_ui_class
@export var game_ui : game_ui_class
@export var game_over_restart_ui: game_over_restart_ui_class
@export var game_over_stats_ui: game_over_stats_ui_class

func restart_game():
	Engine.time_scale = 0
	game_start_ui.enable()
	game_ui.disable()
	game_over_restart_ui.disable()
	game_over_stats_ui.disable()
	

func start_game():
	game_ui.enable(true, false)
	game_start_ui.disable()
	game_over_restart_ui.disable()
	game_over_stats_ui.disable()
	Engine.time_scale = 1

# TODO: move to global signal bus
func game_over():
	Engine.time_scale = 0
	game_ui.disable()
	game_over_stats_ui.enable()
	game_ui.pause_clock()

func stats_continue():
	game_over_stats_ui.disable()
	game_over_restart_ui.enable()

func update_health(hp: float, max_hp = null):
	game_ui.update_health(hp, max_hp)

func update_xp(xp: float, max_xp = null):
	game_ui.update_xp(xp, max_xp)
