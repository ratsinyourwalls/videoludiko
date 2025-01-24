extends Area2D



var start_time
var start_pos
var speed = 0
var wobble = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_pos = position
	start_time = Time.get_ticks_msec()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y = start_pos.y + sin((position.x-start_pos.x)/100.0)*50.0 * wobble
	position.x += delta * speed


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
