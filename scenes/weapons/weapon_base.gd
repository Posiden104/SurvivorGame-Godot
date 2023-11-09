extends Node2D

class_name weapon_base

@export var cooldown: float
@export var damage: float
@export var weapon_name: Enums.WEAPON
@export var damage_tracker: stat_tracker_component
var isBought: bool = false
var level: int
var time_bought: float
var isActive: bool = false
var maxed: bool = false

var bonus_damage_percent: float = 1.0
var cdr_percent: float = 1.0
var projectile_count: float = 1.0

@export_category("Leveling Up")
@export var lvl_up_data: Array[weapon_level_up]


func get_weapon_name() -> String:
	return Enums.get_weapon_name(weapon_name)

func _ready():
	$Cooldown.wait_time = cooldown
	if isBought:
		buy()
	maxed = lvl_up_data.size() < 1

func activate():
	print("dont use weapon_base activate")

func deactivate():
	print("dont use weapon_base deactivate")

func buy():
	if isBought: return
	level = 1
	time_bought = Game.UI.game_ui.clock_time
	isActive = true
	visible = true
	isBought = true
	activate()

func get_next_level_data() -> weapon_level_up:
	if lvl_up_data.size() <= level or lvl_up_data.is_empty():
		print("max level reached for %s" % get_weapon_name())
		maxed = true
		return null
	return lvl_up_data[level]

func level_up():
	if level == 0: 
		buy()
		return
	var data = get_next_level_data()
	if data == null: return
	level += 1
	var attrs = data.get_attributes()
	var values = data.get_values()
	for i in attrs.size():
		var new_val = get(attrs[i]) + float(values[i])
		print("setting %s to %f" % [attrs[i], new_val])
		set(attrs[i], new_val)

func get_damage():
	return damage * Game.Player.weapon_manager.bonus_damage_percent * bonus_damage_percent

func get_projectile_count():
	return projectile_count + Game.Player.weapon_manager.bonus_projectile
