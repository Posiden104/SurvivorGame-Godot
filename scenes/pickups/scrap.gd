extends magnetic_base

@export var scrap_images: Array[CompressedTexture2D]

var image: Texture2D

func _ready():
	image = scrap_images.pick_random()
	$Sprite2D.texture = image
	player = get_tree().get_nodes_in_group("player")[0]
	
func _on_scrap_area_magnetize():
	magnetize()

func _on_scrap_area_pickup():
	queue_free()
	player.increaseScrap()
