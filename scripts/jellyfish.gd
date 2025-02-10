extends RigidBody2D

@export var impulse = Vector2(10, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_jellyfish_animation_looped():
	print("loop")
	apply_central_impulse(impulse.rotated(rotation))
