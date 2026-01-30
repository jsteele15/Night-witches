extends Node

@onready var main_track : AudioStreamPlayer = $"main track"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_track.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
