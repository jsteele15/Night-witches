extends CanvasLayer

@onready var fail_text : RichTextLabel = $"main/fail text"
@onready var main : Node2D = self.get_parent()
@onready var tutorial_box : Control = $"tutorial box"
@onready var restart_button : TextureButton = $"main/restart button"

var death_trig : bool = false
var night_over_trig : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if main.is_this_tutorial == false:
		tutorial_box.visible = false
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameVars.player_shot_down == true and death_trig == false:
		fail_text.visible = true
		
		fail_text.set_up_text("[center]You were shot down".format({}))
		restart_button.visible = true
		death_trig = true
		return
	
	if GameVars.player_alive == false and death_trig == false:
		fail_text.visible = true
		fail_text.set_up_text("[center]You Crashed".format({}))
		restart_button.visible = true
		death_trig = true
		return
		
	if GameVars.night_over == true and night_over_trig == false:
		#fail_text.text = "[center]Night over, points {p}".format({"p": GameVars.current_points})
		fail_text.visible = true
		fail_text.set_up_text("[center]Greatings comrade, you survived the night and inflicted {p} points of damage on the Facists!".format({"p": GameVars.current_points}))
		restart_button.visible = true
		night_over_trig = true


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
