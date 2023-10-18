extends Node2D

@export var isActive : bool = true
@export var bullet : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var b = bullet.instantiate()
	get_node("/root/Game/ProjectileContainer").add_child(b)
	b.global_position = global_position
