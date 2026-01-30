extends Node2D

@onready var play_but : TextureButton = $"start menu canvas/Control/sides screen container/left side container/VBoxContainer/play"#
@onready var tutorial_but : TextureButton = $"start menu canvas/Control/sides screen container/left side container/VBoxContainer/tutorial"
@onready var history_but : TextureButton = $"start menu canvas/Control/sides screen container/left side container/VBoxContainer/history"
@onready var credits_but : TextureButton = $"start menu canvas/Control/sides screen container/left side container/VBoxContainer/credits"
@onready var side_text : RichTextLabel = $"start menu canvas/Control/sides screen container/side info"
@onready var click_sound : AudioStreamPlayer = $"click sound"
var credit_text : String = "[center]
Catgaming - Art

Jam-bone - Programming

Slimehunter - Music

Fonts - Trajanus Roman by Roger White".format({})
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	click_sound.play()
	get_tree().change_scene_to_file("res://map/caucasus.tscn")


func _on_tutorial_pressed() -> void:
	click_sound.play()
	get_tree().change_scene_to_file("res://map/main.tscn")


func _on_credits_pressed() -> void:
	click_sound.play()
	side_text.visible = true
	side_text.set_up_text(credit_text)


func _on_history_pressed() -> void:
	click_sound.play()
	side_text.visible = true
