extends Control

@onready var ui : CanvasLayer = self.get_parent().get_parent()
@onready var indicator : TextureRect = $"plane im"
@onready var bombs : GridContainer = $"bomb container"
#stuff related to visibility
#probably needs more levels but it works for now
var col_by_vis = [{"min": 2, "vis": GameVars.RED},
{"min": 1, "vis": GameVars.YELLOW},
{"min": 0, "vis": GameVars.GREY}]
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#if ui.main.is_this_tutorial == false:
		#$"tutorial noise".visible = false
		#$"tutorial bombs".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_change_vis()
	_change_bombs()
#
#
#	private functions
#
#

func _change_vis():
	for entry in col_by_vis:
		if GameVars.current_sus >= entry.min:
			indicator.modulate = entry.vis
			break

func _change_bombs():
	for i in range(bombs.get_child_count()):
		if i <= GameVars.number_of_bombs:
			bombs.get_child(i).visible = true
		else:
			bombs.get_child(i).visible = false
