extends Area2D

var allied_plane = preload("res://characters/allied_plane.tscn")
const STARTING_POINT_1 : Vector2 = Vector2(55, -90)
const STARTING_POINT_2 : Vector2 = Vector2(-55, -90)
var player : CharacterBody2D 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#
#
#	private functions
#
#

func _spawn_new_planes():
	"""check if theres space for the allied planes then append them"""
	match GameVars.allied_planes.get_child_count():
		0:
			_spawn_plane(STARTING_POINT_1)
			_spawn_plane(STARTING_POINT_2)
		1:
			_spawn_plane(STARTING_POINT_1)
	
	return

func _spawn_plane(offset : Vector2):
	var new_plane = allied_plane.instantiate()
	
	new_plane.position = player.position + offset
	
	GameVars.allied_planes.add_child(new_plane)
	new_plane.rotation_degrees = player.rotation_degrees

	

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("_bomb"):
		
		if GameVars.onto_base == true:
			GameVars.onto_allies = true
		player = body
		GameVars.number_of_bombs = GameVars.MAX_BOMBS
		_spawn_new_planes()
		return
		if GameVars.being_persued == true:
			GameVars.being_persued = false
			GameVars.persuer.target = GameVars.allied_planes.get_child(0)
			GameVars.persuer = null
