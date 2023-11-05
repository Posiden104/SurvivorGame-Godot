extends Node2D

class_name weapon_base

@export var level: int
@export var isBought: bool = false
@export var isActive: bool = false
@export var cooldown: float
@export var damage: float
@export var time_bought: float
@export var weapon_name: Enums.WEAPON

var cdr_percent: float
var bonus_damage_percent: float
var projectile_count: int

@export_category("Leveling Up")
@export var lvl_up_data: Array[weapon_level_up]


func get_weapon_name() -> String:
	return Enums.WEAPON.keys()[weapon_name]

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
	time_bought = Game.UI.game_ui.clock_time
	isActive = true
	visible = true
	isBought = true
	activate()
	
func level_up():
	level += 1
