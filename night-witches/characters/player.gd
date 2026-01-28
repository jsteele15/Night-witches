extends CharacterBody2D

@onready var main : Node2D = self.get_parent()
@onready var plane_image : Sprite2D = $Plane
var speed : float = 300.0
const MAX_SPEED : float = 300.0
const BOTTOM_SPEED : float = 200.0
var fuel : int = 100
var FUEL_LOSS : int = 1
var scale_by_height = [{ "min": 3000, "scale": Vector2(1, 1) },
{ "min": 2500, "scale": Vector2(0.9, 0.9) },
{ "min": 2000, "scale": Vector2(0.8, 0.8) },
{ "min": 1500, "scale": Vector2(0.7, 0.7) },
{ "min": 1000, "scale": Vector2(0.6, 0.6) },
{ "min": 500, "scale": Vector2(0.5, 0.5) },
]

#for movement
var left : bool = false
var right : bool = false
var engine_on : bool = true

func _physics_process(delta: float) -> void:
	if GameVars.player_alive == false:
		return
	_move(delta)
	_change_hight()
	_crash()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left"):
		left = true
	
	if event.is_action_pressed("right"):
		right = true
	
	if event.is_action_pressed("bomb"):
		_bomb()
	
	if event.is_action_released("left"):
		left = false
	
	if event.is_action_released("right"):
		right = false
	
	if event.is_action_pressed("engine"):
		if engine_on == true:
			engine_on = false
		else:
			engine_on = true
		print(engine_on)

#
#
#	private functions
#
#

func _move(delta: float):
	#for the rotation
	if right == true and left == true:
		pass
	else:
		#rotate the plane 
		if right == true:
			self.rotation_degrees += 5 
		if left == true:
			self.rotation_degrees -= 5 
	#position += transform.y * SPEED * delta
	velocity = transform.y * speed
	move_and_slide()

func _change_hight():
	"""if engine is off, reduce the hight and the sound of the player"""
	if engine_on == true:
		if GameVars.current_hight < GameVars.MAX_HIGHT:
			#TODO change this to a tween, itll look nicer
			GameVars.current_hight += GameVars.SPEED_LOSE_ALTITUDE
			
	else:
		if GameVars.current_hight > GameVars.LOWEST_HIGHT:
			GameVars.current_hight -= GameVars.SPEED_LOSE_ALTITUDE
	
	#to scale the images based on altitude
	for entry in scale_by_height:
		if GameVars.current_hight >= entry.min:
			plane_image.scale = entry.scale
			break

func _bomb():
	"""check how many bomb we have left, if its zero, return"""
	if GameVars.number_of_bombs > 0:
		main.building_container.bombing()
	else:
		print("out of bombs")
		return

func _crash():
	"""will check for hight then do a death"""
	if GameVars.current_hight == GameVars.LOWEST_HIGHT:
		GameVars.player_alive = false
