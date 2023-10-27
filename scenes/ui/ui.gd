extends CanvasLayer

var clock_time: float
var clock_text: String
var clock_format: String = "%02d:%02d"

@export var timer_label: Label 
@export var health_bar: TextureProgressBar
@export var xp_bar: TextureProgressBar



func _ready() -> void:
	update_clock()

func hide_game_ui():           
	pass

func _process(delta: float) -> void:
	clock_time += delta

func _on_clock_update_timer_timeout() -> void:
	update_clock()
	
func update_clock() -> void:
	@warning_ignore("integer_division")
	var minutes: int = int(clock_time) / 60
	var sec: int = int(clock_time) % 60
	clock_text = clock_format % [minutes, sec]
	timer_label.set_text(clock_text)
	
func update_health(hp: float, max_hp = null):
	if max_hp: health_bar.max_value = max_hp
	health_bar.value = hp

func update_xp(xp: float, max_xp = null):
	if max_xp: xp_bar.max_value = max_xp
	xp_bar.value = xp