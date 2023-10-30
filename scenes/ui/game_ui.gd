extends Control

@export var health_bar: TextureProgressBar
@export var xp_bar: TextureProgressBar
@export var clock: Label

var clock_running: bool = false
var clock_time: float
var clock_text: String
var clock_format: String = "%02d:%02d"

func _ready() -> void:
	update_clock()

func _process(delta: float) -> void:
	if clock_running: 
		clock_time += delta

func update_health(hp: float, max_hp = null):
	if max_hp: health_bar.max_value = max_hp
	health_bar.value = hp

func update_xp(xp: float, max_xp = null):
	if max_xp: xp_bar.max_value = max_xp
	xp_bar.value = xp

func start_clock():
	clock_running = true
	update_clock()

func pause_clock():
	clock_running = false
	update_clock()

func _on_clock_update_timer_timeout() -> void:
	update_clock()

func update_clock() -> void:
	clock.set_text(format_time(clock_time))

func format_time(time: float) -> String:
	@warning_ignore("integer_division")
	var minutes: int = int(time) / 60
	var sec: int = int(time) % 60
	var txt = clock_format % [minutes, sec]
	return txt
