extends weapon_base

@export var bullet : PackedScene
@export var damage_tracker: stat_tracker_component


func activate():
	_on_timer_timeout()
	$Cooldown.start()

func _on_timer_timeout():
	var b = bullet.instantiate() as bullet
	b.dir = Game.Player.dir
	b.global_position = global_position
	b.hitbox.damage = damage
	b.hitbox.damage_dealt.connect(damage_tracker.add)
	MessageBus.add_projectile.emit(b)
