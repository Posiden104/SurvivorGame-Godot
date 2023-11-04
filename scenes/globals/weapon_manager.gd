extends Node


var weapon_directory: String = "res://mods/scenes/weapons/"
@export var weapon_array: Array[PackedScene]
var weapons: Dictionary


#func _ready() -> void:
#	for ps in weapon_array:
#		var scene = ps.instantiate()
#		var wep_name = ps.weapon_name.to_snake_case()
#		weapons[wep_name] = scene

#func get_weapon(weapon_name: String) -> Node: 
#	print("looking for ", weapon_name.to_snake_case())
#	if weapons.has(weapon_name.to_snake_case()):
#		return weapons[weapon_name.to_snake_case()]
#	else:
#		return null
	
func get_packed_weapon(index: int) -> PackedScene:
	if index < weapon_array.size():
		return weapon_array[index]
	return null

# Look for modded weapons?
#	var weapon_files = getFilePathsByExtension(weapon_directory, "tscn", true)
#	for w in weapon_files:
#		var scene = load(w).instantiate()
#		weapons[scene.name.to_snake_case()] = scene
#		print(scene.name.to_snake_case())
func getFilePathsByExtension(directoryPath: String, extension: String, recursive: bool = true) -> Array:
	var dir := DirAccess.open(directoryPath)
	if not dir:
		printerr("Warning: could not open directory: ", directoryPath)
		return []
	
	if dir.list_dir_begin():
		printerr("Warning: could not list contents of: ", directoryPath)
		return []

	var filePaths := []
	var fileName := dir.get_next()

	while fileName != "":
		if dir.current_is_dir():
			if recursive:
				var dirPath = dir.get_current_dir() + "/" + fileName
				filePaths += getFilePathsByExtension(dirPath, extension, recursive)
		else:
			if fileName.get_extension() == extension:
				var filePath = dir.get_current_dir() + "/" + fileName
				filePaths.append(filePath)
	
		fileName = dir.get_next()
	dir.list_dir_end()
	return filePaths
