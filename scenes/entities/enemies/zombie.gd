extends Entity

@export var hitbox: hitbox_component

var targetPos: Vector2
var is_touching_player: bool = false
var body_to_damage: Node2D

func _ready():
	health.died.connect(_on_health_component_died)
	health.health_update.connect(_on_health_component_health_update)
	hitbox.damage_ready.connect(_on_hitbox_component_damage_ready)
	hitbox.body_entered.connect(_on_hitbox_component_body_entered)
	hitbox.body_exited.connect(_on_hitbox_component_body_exited)
	sprite.material.set("shader_parameter/active", false)
	
func _physics_process(_delta):
	if Engine.time_scale == 0:
		return
	targetPos = Game.Player.get_position()
	var v = targetPos - position
	
	v = v.normalized() * speed
	set_velocity(v)
	move_and_slide()

func _on_health_component_health_update(old_hp, new_hp):
	if old_hp > new_hp:
		animation_player.play("hurt")

func _on_health_component_died():
	scrap_spawner.call_deferred("try_spawn")
	queue_free()

func _on_hitbox_component_body_entered(body: Node2D) -> void:
	is_touching_player = true
	body_to_damage = body
	hitbox.do_damage(body)

func _on_hitbox_component_body_exited(_body: Node2D) -> void:
	is_touching_player = false
	body_to_damage = null

func _on_hitbox_component_damage_ready() -> void:
	if is_touching_player:
		hitbox.do_damage(body_to_damage)
