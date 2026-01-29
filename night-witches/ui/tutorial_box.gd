extends Control

@onready var tutorial_text : RichTextLabel = $"game text"
@onready var next_button : Button = $"next button"

var this_trig : bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameVars.intro == false:
		tutorial_text.set_up_text(GameVars.TUTORIAL_INTRO)
		GameVars.intro = true
	
	if GameVars.onto_allies == true and this_trig == false:
		tutorial_text.set_up_text(GameVars.TUTORIAL_ALLIES)
		next_button.visible = true
		this_trig = true
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left") or event.is_action_pressed("right"):
		if GameVars.onto_move == true:
			tutorial_text.set_up_text(GameVars.TUTORIAL_SPACE)
			GameVars.onto_move = false
			GameVars.onto_bomb = true
	
	if event.is_action_pressed("bomb"):
		if GameVars.onto_bomb == true:
			tutorial_text.set_up_text(GameVars.TUTORIAL_NOISE)
			GameVars.onto_bomb = false
			GameVars.onto_noise = true
			
	if event.is_action_pressed("engine"):
		if GameVars.onto_noise == true:
			tutorial_text.set_up_text(GameVars.TUTORIAL_BASE)
			GameVars.onto_noise = false
			GameVars.onto_base = true

func _on_next_button_pressed() -> void:
	if GameVars.onto_end == true:
		get_tree().change_scene_to_file("res://ui/start_menu.tscn")
		pass
	
	if GameVars.onto_allies == true:
		tutorial_text.set_up_text(GameVars.TUTORIAL_END)
		GameVars.onto_end = true
		return
		
	if GameVars.intro == true:
		next_button.visible = false
		GameVars.move_around = true
		tutorial_text.set_up_text(GameVars.TUTORIAL_MOVE)
		GameVars.onto_move = true
