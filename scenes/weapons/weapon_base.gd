extends Node2D

class_name weapon_base

@export var level: int
@export var isBought: bool = false
@export var isActive: bool = false
@export var cooldown: float
@export var damage: float
@export var time_bought: float
@export var weapon_name: String

func _ready():
	$Cooldown.wait_time = cooldown
	if isBought:
		buy()

func activate():
	print("dont use weapon_base activate")

func deactivate():
	print("dont use weapon_base deactivate")

func buy():
	level = 1
	$Cooldown.start()
	time_bought = Game.UI.game_ui.clock_time
	isActive = true
	visible = true
	isBought = true
	
func level_up():
	level += 1
