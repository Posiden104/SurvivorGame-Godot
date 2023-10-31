extends Node

class_name stats_manager

var deaths: Dictionary = {}

func add_death(entity: String):
	if deaths.has(entity):
		deaths[entity] += 1
	else :
		deaths[entity] = 1
	print(entity + ": " + str(deaths[entity]))
