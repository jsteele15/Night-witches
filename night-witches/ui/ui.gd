extends CanvasLayer

@onready var fail_text : RichTextLabel = $"main/fail text"

var death_trig : bool = false
var night_over_trig : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameVars.player_alive == false and death_trig == false:
		fail_text.visible = true
		fail_text.set_up_text("[center]You Crashed".format({}))
		death_trig = true
		
	if GameVars.night_over == true and night_over_trig == false:
		fail_text.text = "[center]Night over, points {p}".format({"p": GameVars.current_points})
		fail_text.visible = true
		fail_text.set_up_text("[center]Night over, points {p}".format({"p": GameVars.current_points}))
		night_over_trig = true
