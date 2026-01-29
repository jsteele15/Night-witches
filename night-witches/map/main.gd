extends Node2D

@onready var ground_layer : TileMapLayer = $"ground layer"
@onready var building_container : Node = $"building container"
@onready var player : CharacterBody2D = $player
@onready var allied_planes : Node = $"allied planes"
@export var is_this_tutorial : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameVars.reset()
	GameVars.reset_tutorial()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
