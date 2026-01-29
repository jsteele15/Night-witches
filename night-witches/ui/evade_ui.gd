extends Control

@onready var game_text : RichTextLabel = $"game text"
@onready var time_text : RichTextLabel = $"game text2"
@onready var timer : Timer = $"evade time"
var pers_started : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_text.is_clock = true
	time_text.is_clock = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(round($"evade time".time_left))
	game_text.text = "[center]Evade within"
	time_text.text = "[center]%.2f" % timer.time_left
	if GameVars.being_persued == true and pers_started == false:
		self.visible = true
		timer.start()
		pers_started = true
	if GameVars.being_persued == false:
		self.visible = false
		pers_started = false
		timer.stop()
	


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("bomb"):
		timer.stop()
	if event.is_action_pressed("left"):
		timer.start()


func _on_evade_time_timeout() -> void:
	GameVars.player_alive = false
	GameVars.player_shot_down = true
