extends Node2D

class_name weapon_base

@export var damage: float
@export var level: int
@export var isBought: bool = false
@export var isActive: bool = false
@export var cooldown: float

func _ready():
	$Cooldown.wait_time = cooldown
