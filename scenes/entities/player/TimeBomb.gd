extends weapon_base

@export var bomb_scene: PackedScene
@export var fuse_time: float = 5

func _on_bomb_cooldown_timer_timeout():
	var b = bomb_scene.instantiate() as time_bomb
	b.damage = 5
	b.fuse_time = fuse_time
	b.global_position = global_position
	$"../../".placeTimeBomb(b)
	$Cooldown.start()
