extends Node2D

@export var scrap_images: Array[CompressedTexture2D]
@export var fly_speed: float = 300

var image: Texture2D
var isMagnetized:bool = false
var player

func _ready():
	image = scrap_images.pick_random()
	$Sprite2D.texture = image
	player = get_tree().get_nodes_in_group("player")[0]

func _process(delta):
	if isMagnetized:
		var dir = (player.global_position - global_position) as Vector2
		global_position += dir.normalized() * fly_speed * delta
		
func magnetize():
	isMagnetized = true

func _on_scrap_area_area_entered(area):
	if area.is_in_group("player_pickup"):
		magnetize()


func _on_scrap_area_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
		player.increaseScrap()
