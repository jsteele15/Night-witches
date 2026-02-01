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

	if GameVars.friendly_buildings.get_child_count() > 1:
		var saved_dist = 0
		var saved_base = GameVars.friendly_buildings.get_child(0)
		for c in GameVars.friendly_buildings.get_children():
			if c.position.distance_to(c.position) > saved_dist: #this works, just need to figure out the said logic
				saved_dist = c.position.distance_to(c.position)
				saved_base = c
		look_at(saved_base.global_position)
		
	else:

		look_at(GameVars.friendly_buildings.get_child(0).global_position)
