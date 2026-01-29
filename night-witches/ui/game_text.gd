extends RichTextLabel


@export var reveal_time := 1.0  # seconds to reveal whole text

var t := 0.0
var total_chars := 0
var is_clock : bool = false

func _process(delta):
	if is_clock == true:
		return
	if visible_characters >= total_chars:
		return

	t += delta
	var alpha = clamp(t / reveal_time, 0.0, 1.0)

	# Lerp from 0 → total_chars
	visible_characters = int(lerp(0.0, float(total_chars), alpha))

#
#
#	public functions
#
#

func set_up_text(txt : String):
	"""turn the process function off, set a text, the total character count of said text and bam"""
	set_process(false)
	self.text = txt
	total_chars = get_total_character_count()
	visible_characters = 0
	t = 0.0
	set_process(true)
