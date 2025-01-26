extends CharacterBody2D


@export var speed = 100
@export var bullet: PackedScene


func _physics_process(_delta: float) -> void:
	var dir = Vector2.ZERO
	if Input.is_action_pressed("UP"):
		dir.y -= 1
	if Input.is_action_pressed("DOWN"):
		dir.y += 1
	if Input.is_action_pressed("LEFT"):
		dir.x -= 1
	if Input.is_action_pressed("RIGHT"):
		dir.x += 1

	position.x = clamp(position.x, 16, 256-16)
	position.y = clamp(position.y, 16, 240-16)


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	velocity = dir * speed
	move_and_slide()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("FIRE"):
		if $ShootTimer.is_stopped():
			$ShootTimer.start(0.05)
			var bull = bullet.instantiate()
			bull.position = global_position
			bull.position.x += 16.0
			bull.speed = Vector2(500.0,0)
			bull.set_collision_layer_value(2,true)
			bull.set_collision_mask_value(8,true)
			bull.wobble = 0
			$Node.add_child(bull)


func _on_hit_area_area_entered(_area:Area2D) -> void:
	queue_free()
