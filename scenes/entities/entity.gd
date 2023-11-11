extends CharacterBody2D
class_name Entity

@export var sprite: Sprite2D

@export_group("components")
@export var health: health_component
@export var hurtbox: hurtbox_component
@export var scrap_spawner: scrap_spawner_component_script
@export var animation_player: AnimationPlayer
