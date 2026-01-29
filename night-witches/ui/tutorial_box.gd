extends Control

@onready var tutorial_text : RichTextLabel = $"game text"
@onready var next_button : Button = $"game text/next button"
var intro : bool = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if intro == false:
		tutorial_text.set_up_text(GameVars.TUTORIAL_INTRO)
		intro = true
