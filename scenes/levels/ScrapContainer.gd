extends Marker2D

func _ready() -> void:
	MessageBus.add_scrap.connect(add_child)
