extends CanvasLayer

@onready var fail_text : RichTextLabel = $"fail text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameVars.player_alive == false:
		fail_text.visible = true
		
	if GameVars.night_over == true:
		fail_text.text = "[center]Night over, points {p}".format({"p": GameVars.current_points})
		fail_text.visible = true
