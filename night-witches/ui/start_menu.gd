extends Node2D

@onready var play_but : Button = $"start menu canvas/Control/sides screen container/left side container/VBoxContainer/play"#
@onready var tutorial_but : Button = $"start menu canvas/Control/sides screen container/left side container/VBoxContainer/tutorial"
@onready var history_but : Button = $"start menu canvas/Control/sides screen container/left side container/VBoxContainer/history"
@onready var credits_but : Button = $"start menu canvas/Control/sides screen container/left side container/VBoxContainer/credits"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	pass # Replace with function body.


func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://map/main.tscn")
