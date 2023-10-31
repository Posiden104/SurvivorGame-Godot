extends weapon_base

class_name active_weapon_base

@export var activeTime: float

func _ready():
	super()
	$ActiveTimer.wait_time = activeTime

func set_active(_val: bool):
	print("dont use active_weapon_base set_active")
