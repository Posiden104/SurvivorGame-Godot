extends Node2D

class_name weapon_base

@export var cooldown: float
@export var damage: float
@export var ignore_projectile_count: bool = false
@export var weapon_name: Enums.WEAPON
@export var damage_tracker: stat_tracker_component
var isBought: bool = false
var level: int
var time_bought: float
var isActive: bool = false

var cdr_percent: float
var bonus_damage_percent: float
var projectile_count: float = 1.0:
	set(val):
		if not ignore_projectile_count:
			projectile_count = val

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
	var zero_index_level_offset = 2 # lvl up data starts at 0, but starts applying at lv 2
	level += 1
	if lvl_up_data.size() <= level - zero_index_level_offset:
		print("no more level up data!!")
		print("max level reached!!")
		return
	var data = lvl_up_data[level - zero_index_level_offset]
	var attrs = data.get_attributes()
	var values = data.get_values()
	if values.size() < attrs.size():
		print("Fewer values than attributes!!")
		print("Will set values to 1")
		for i in attrs.size() - values.size():
			values.push_back("1")
	for i in attrs.size():
		var new_val = get(attrs[i]) + float(values[i])
		print("setting %s to %f" % [attrs[i], new_val])
		set(attrs[i], new_val)
