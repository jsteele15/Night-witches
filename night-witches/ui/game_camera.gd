extends Camera2D


var shake_strength: float = 0.0
var shake_decay: float = 5.0   # how fast the shake fades
var max_offset: float = 20.0   # maximum shake distance

func _process(delta: float) -> void:
	if shake_strength > 0.01:
		# random offset each frame
		offset = Vector2(
			randf_range(-shake_strength, shake_strength),
			randf_range(-shake_strength, shake_strength)
		)

		# decay the shake
		shake_strength = lerp(shake_strength, 0.0, shake_decay * delta)
	else:
		offset = Vector2.ZERO


func shake(amount: float = 1.0) -> void:
	shake_strength = clamp(amount * max_offset, 0.0, max_offset)
