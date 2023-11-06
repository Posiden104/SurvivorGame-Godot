extends Resource

class_name weapon_level_up

@export_multiline var text: String
@export var attributes: String
@export var values: String


func get_attributes() -> PackedStringArray:
	return attributes.split(",")
	
func get_values() -> PackedStringArray:
	var v = values.split(",")
	var a_len = get_attributes().size()
	if v.size() < a_len:
		print("Fewer values than attributes!!")
		print("Will set values to 1")
		for i in a_len - v.size():
			v.push_back("1")
	return v
