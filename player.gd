extends Area2D

@export var speed = 100
@export var bullet: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
			bull.position.x += 70
			bull.linear_velocity.x = 1000
			add_child(bull)

	position += dir.normalized()*delta*speed
	var windowSize = DisplayServer.window_get_size()
	position.x = clamp(position.x, 0, windowSize.x)
	position.y = clamp(position.y, 0, windowSize.y)
