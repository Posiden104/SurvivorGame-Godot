extends weapon_base

@export var bomb_scene: PackedScene
@export var fuse_time: float = 5

func activate():
	place_bomb()
	$Cooldown.start()

func _on_bomb_cooldown_timer_timeout():
	activate()

func place_bomb():
	var b = bomb_scene.instantiate() as time_bomb
	b.hitbox.damage = 5
	b.fuse_time = fuse_time
	b.global_position = global_position
	$"../../".placeTimeBomb(b)
