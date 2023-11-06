extends Resource

class_name weapon_level_up

@export var text: String
@export var attributes: String
@export var values: String


func get_attributes() -> PackedStringArray:
	return attributes.split(",")
	
func get_values() -> PackedStringArray:
	return values.split(",")
