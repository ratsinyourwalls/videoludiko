extends Area2D


var start_time 
var center
@export var bullet: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_time = Time.get_ticks_msec()
	center = position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var elapsed_time = Time.get_ticks_msec() - start_time
	position.y = center + sin(elapsed_time/1000.0)*70.0


func _on_area_entered(_area: Area2D) -> void:
	queue_free()


func _on_shoot_timer_timeout() -> void:
	var player = get_node_or_null("/root/Main/Camera2D/Player")
	if player == null: return

	var bull = bullet.instantiate()
	bull.position = position
	bull.position.x -= 9

	var angle = player.global_position - bull.global_position
	angle = angle.normalized()
	bull.speed = angle * 100.0
	bull.wobble = 0.2

	bull.set_collision_layer_value(3,true)
	get_parent().add_child(bull)
