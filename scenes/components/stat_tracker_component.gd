extends Node2D

class_name stat_tracker_component

@export var stat_name: String
var value: float

func add(amt: float):
	value += amt
	print(stat_name + " " + str(value))
