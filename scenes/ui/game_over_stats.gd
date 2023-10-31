extends Control

class_name game_over_stats_ui_class

@export var stats_text: Label

func enable() -> void:
	update_stats()
	visible = true

func disable() -> void:
	visible = false
	
func update_stats():
	var s = ""
	
	var stats = Game.STATS_MANAGER as stats_manager
	s += "Enemy          Deaths\n"
	for entity_name in stats.deaths.keys():
		s += "%s          %d\n" % [str(entity_name), stats.deaths.get(entity_name)]
	
	s +="\n\nWeapon Stats\n"
	s +="\n\nWeapon          Damage          Time Active          DPS\n"
	var trackers = get_tree().get_nodes_in_group("stat_tracker") as Array[stat_tracker_component]
	for tracker in trackers:
		
		s += tracker.get_stats("%s          %s          %s          %s\n")
	
	stats_text.text = s


func _on_continue_button_pressed() -> void:
	Game.UI.stats_continue()
