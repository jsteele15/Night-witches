extends Control
@onready var ui : CanvasLayer = self.get_parent()
@onready var alt_bar : ProgressBar = $ProgressBar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	alt_bar.step = GameVars.SPEED_LOSE_ALTITUDE
	#print(ui, ui.main)
	#if ui.main.is_this_tutorial == false:
		#$"tutorial hight".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	alt_bar.value = GameVars.current_hight
