extends weapon_base

@export var bullet : PackedScene
@export var damage_tracker: stat_tracker_component


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	if isActive:
		$Cooldown.start()

func _on_timer_timeout():
	var b = bullet.instantiate() as bullet
	b.dir = $"../..".dir
	b.global_position = global_position
	b.hitbox.damage = damage
	b.hitbox.damage_dealt.connect(damage_tracker.add)
	MessageBus.add_projectile.emit(b)
