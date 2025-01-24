extends Area2D


# Called when the node enters the scene tree for the first time.
var start_time 
var center
@export var bullet: PackedScene

func _ready() -> void:
	start_time = Time.get_ticks_msec()
	center = position.y
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var elapsed_time = Time.get_ticks_msec() - start_time
	position.y = center + sin(elapsed_time/1000.0)*10.0


func _on_area_entered(_area: Area2D) -> void:
	queue_free()


func _on_shoot_timer_timeout() -> void:
	var bull = bullet.instantiate()
	bull.position = position
	bull.position.x -= 50
	bull.speed = -1000.0
	bull.wobble = 2.0
	$Node.add_child(bull)

