extends Area2D
class_name hitbox_component

signal damage_ready
signal damage_dealt(dmg: float)

@export var damage: float
@export var damage_cooldown: float = 0.01
@export var has_damage_cooldown: bool = false

var can_damage: bool = true
@onready var damage_cooldown_timer: Timer = $DamageCooldownTimer

func _ready() -> void:
	damage_cooldown_timer.wait_time = damage_cooldown
	damage_cooldown_timer.timeout.connect(_on_damage_cooldown_timeout)

func do_damage(body):
	if not can_damage:
		return
	if has_damage_cooldown:
		can_damage = false
		damage_cooldown_timer.start()
	
	for c in body.get_children():
		if c is health_component:
			c.damage(damage)
			damage_dealt.emit(damage)

func _on_damage_cooldown_timeout() -> void:
	can_damage = true
	damage_ready.emit()
