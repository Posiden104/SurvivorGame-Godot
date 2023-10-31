extends CharacterBody2D

var player

@export var health: health_component
@export var hurtbox: hurtbox_component
@export var hitbox: hitbox_component
@export var speed:float = 50

var targetPos: Vector2
var is_touching_player: bool = false
var body_to_damage: Node2D

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	health.died.connect(_on_health_component_died)
	hitbox.damage_ready.connect(_on_hitbox_component_damage_ready)
	hitbox.body_entered.connect(_on_hitbox_component_body_entered)
	hitbox.body_exited.connect(_on_hitbox_component_body_exited)

func _physics_process(_delta):
	targetPos = player.get_position()
	var v = targetPos - position
	
	v = v.normalized() * speed
	set_velocity(v)
	move_and_slide()

func _on_health_component_died():
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
