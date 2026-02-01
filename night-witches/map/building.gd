extends Area2D

@export var building_type : int = 0
@onready var build_im : Sprite2D
@onready var smoke : GPUParticles2D = $smooke
enum building_types {
	HOUSE = 0,
	FACTORY = 1,
	TANK = 2,
	none1 = 3,
	SUPPLIES = 4,
	non2 = 5,
	ARRTILERY = 6,
	non3 = 7,
	BARBED = 8,
	non4,
	BRIDGE
}

var inside : bool = false
var destroyed : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#such a dumb fucking way of doing this
	build_im = self.get_child(1)
	build_im.frame = building_type


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#
#
#	public functions
#

func bombed():
	if destroyed == false:
		build_im.frame +=1
		GameVars.current_points += GameVars.SMALL_TARGET
		destroyed = true
		smoke.emitting = true

#
#
# signal functions
#



func _on_body_entered(body: Node2D) -> void:
	if body.has_method("_bomb"):
		print("plane entered")
		inside = true


func _on_body_exited(body: Node2D) -> void:
	if body.has_method("_bomb"):
		print("plane exited")
		inside = false
