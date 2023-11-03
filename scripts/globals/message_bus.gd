extends Node

# Player signals
signal player_health_changed(hp: float, max_hp: float)
signal player_xp_changed(xp: float, max_xp: float)
signal player_level_up(level: int)

# Level related signals
signal add_projectile(projectile_scene)
signal spawn_enemy(enemy)
