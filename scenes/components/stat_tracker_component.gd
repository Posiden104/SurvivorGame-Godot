extends Node2D

class_name stat_tracker_component

@export var weapon: weapon_base

var value: float

func _ready() -> void:
	add_to_group("stat_tracker")

func add(amt: float):
	value += amt
	
func get_stats(format: String) -> String:
	if not weapon.isBought:
		return ""
	
	var life = Game.UI.game_ui.clock_time - weapon.time_bought
	var life_formatted = game_ui_class.format_time(life)
	var dps = value / life
	return format % [weapon.get_weapon_name().capitalize(), format_number(value), life_formatted, format_number(dps)]

func format_number(val: float) -> String:
	if fmod(val, 1.0) == 0:
		return "%.d" % val 
	if val < 1000:
		return "%.2f" % val
	else:
		return "%.2fk" % (val / 1000.0)
