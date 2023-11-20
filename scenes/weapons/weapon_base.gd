extends Node2D

class_name weapon_base

@export_group("Weapon")
@export var cooldown: float
@export var damage: float
@export var weapon_name: Enums.WEAPON
@export var damage_tracker: stat_tracker_component

@export_group("Projectiles", "projectile")

@export var projectile_hitLimit: int = 1
@export var projectile_bulletLife: float = 1

var weapon: Weapon

var isBought: bool = false
var level: int
var time_bought: float
var isActive: bool = false
var maxed: bool = false
var accuracy: float

var bonus_damage_percent: float = 1.0
var cdr_percent: float = 1.0
var projectile_count: float = 1.0



func get_weapon_name() -> String:
	return Enums.get_weapon_name(weapon_name)

func _ready():
	$Cooldown.wait_time = cooldown
	if isBought:
		buy()
	maxed = weapon.level_up_data.is_empty()

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
	maxed = weapon.level_up_data.is_empty()	
	activate()

func get_next_level_data() -> weapon_level_up:
	if weapon.level_up_data.size() <= level or weapon.level_up_data.is_empty():
		print("max level reached for %s" % get_weapon_name())
		maxed = true
		return null
	return weapon.level_up_data[level]

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
