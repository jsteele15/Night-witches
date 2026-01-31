extends Control
@onready var ui : CanvasLayer = self.get_parent()
@onready var alt_bar : TextureProgressBar = $ProgressBar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	alt_bar.step = GameVars.SPEED_LOSE_ALTITUDE



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	alt_bar.value = GameVars.current_hight
	if GameVars.onto_noise == true:
		$"tutorial hight".visible = true
