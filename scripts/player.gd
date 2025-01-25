extends Area2D

@export var speed = 100
@export var bullet: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dir = Vector2.ZERO
	if Input.is_action_pressed("UP"):
		dir.y -= 1
	if Input.is_action_pressed("DOWN"):
		dir.y += 1
	if Input.is_action_pressed("LEFT"):
		dir.x -= 1
	if Input.is_action_pressed("RIGHT"):
		dir.x += 1
	if Input.is_action_pressed("FIRE"):
		if $ShootTimer.is_stopped():
			$ShootTimer.start(0.05)
			var bull = bullet.instantiate()
			bull.position = position
			bull.position.x += 16.0
			bull.speed = Vector2(500.0,0)
			bull.set_collision_layer_value(2,true)
			bull.wobble = 0
			$Node.add_child(bull)

	position += dir.normalized()*delta*speed
	position.x = clamp(position.x, 32, 256-32)
	position.y = clamp(position.y, 32, 240-32)


func _on_area_entered(_area:Area2D) -> void:
	queue_free()
