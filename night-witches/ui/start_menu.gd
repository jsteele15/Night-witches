extends Node2D

@onready var play_but : TextureButton = $"start menu canvas/Control/sides screen container/left side container/VBoxContainer/play"#
@onready var tutorial_but : TextureButton = $"start menu canvas/Control/sides screen container/left side container/VBoxContainer/tutorial"
@onready var history_but : TextureButton = $"start menu canvas/Control/sides screen container/left side container/VBoxContainer/history"
@onready var credits_but : TextureButton = $"start menu canvas/Control/sides screen container/left side container/VBoxContainer/credits"
@onready var side_text : RichTextLabel = $"start menu canvas/Control/sides screen container/side info"
@onready var click_sound : AudioStreamPlayer = $"click sound"
@onready var plane : TextureRect = $"start menu canvas/plane rect"
@onready var plane2 : TextureRect = $"start menu canvas/plane rect2"
var credit_text : String = "[center]
DillonEntm't - Art

Jam-bone - Programming

Slimehunter - Music

Fonts - Trajanus Roman by Roger White".format({})

var history_text : String = "[left]
The 588th Night Bomber Regiment was an all‑female unit of the Soviet Air Forces during World War II.

Founded by Marina Raskova, the regiment included 261 women over the course of the war. They flew more than 30,000 missions during major Soviet offensives such as the Battle of the Caucasus (1942) and the Polish Offensive (1944).

They carried out their raids at night, often cutting their engines to maintain the element of surprise. The whooshing sound their biplanes made while gliding earned them the nickname “Night Witches.” Flying in small squads, some aircraft would distract enemy defenses while others proceeded to the target.

In total, 32 women died while serving in the 588th, and 23 were awarded the title Hero of the Soviet Union."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"main track".play()
	$smooke.emitting = true



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	plane.position.y -= 5
	plane2.position.y -= 5
	


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
	side_text.set_up_text(history_text)
