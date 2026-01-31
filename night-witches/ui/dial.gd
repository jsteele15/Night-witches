extends CharacterBody2D

@onready var main : Node2D = self.get_parent()
var closest_base

func _physics_process(delta: float) -> void:
	if GameVars.number_of_bombs > -1:
		self.visible = false
		return
	else:
		self.visible = true
	
	if GameVars.player != null:
		self.global_position = GameVars.player.position
		
	#get a list of all the bases, and then angle it towers that base
	#main.ground_layer.get_node()
