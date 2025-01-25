extends Area2D



var start_time
var start_pos
var speed :Vector2
var wobble = 1
var last_wobbling = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_pos = position
	start_time = Time.get_ticks_msec()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var wobbling = Vector2.ZERO
	wobbling.y = sin(position.distance_to(start_pos)/16.0)*16.0*wobble
	wobbling = wobbling.rotated(speed.angle())
	position += delta * speed + wobbling - last_wobbling
	last_wobbling = wobbling


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
