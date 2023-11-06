extends CanvasLayer

class_name ui_script

@export var game_start_ui : game_start_ui_class
@export var game_ui : game_ui_class
@export var game_over_restart_ui: game_over_restart_ui_class
@export var game_over_stats_ui: game_over_stats_ui_class
@export var level_up_ui: level_up_ui_class

func _ready() -> void:
	MessageBus.player_level_up.connect(level_up)

func restart_game():
	Engine.time_scale = 0
	game_start_ui.enable()
	game_ui.disable()
	game_over_restart_ui.disable()
	game_over_stats_ui.disable()
	level_up_ui.disable()

func start_game():
	game_ui.enable(true, false)
	game_start_ui.disable()
	game_over_restart_ui.disable()
	game_over_stats_ui.disable()
	level_up_ui.disable()
	Engine.time_scale = 1

func game_over():
	Engine.time_scale = 0
	game_ui.disable()
	game_over_stats_ui.enable()
	game_ui.pause_clock()

func stats_continue():
	game_over_stats_ui.disable()
	game_over_restart_ui.enable()
	
func level_up():
	Engine.time_scale = 0
	level_up_ui.enable()
	
func resume_game():
	Engine.time_scale = 1
	game_ui.enable(false, false)
	game_start_ui.disable()
	game_over_restart_ui.disable()
	game_over_stats_ui.disable()
	level_up_ui.disable()
	
