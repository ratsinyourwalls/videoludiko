extends RigidBody2D

@export var impulse = Vector2(10, 0)
@export var down = Vector2(0, 0)
var jelly

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	jelly = get_node("Jellyfish")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_jellyfish_animation_looped():
	print("loop")
	constant_force = (impulse.rotated(rotation)) 

func _on_jellyfish_frame_changed():
	print("hi?")
	print(jelly.frame)
	if(jelly.frame == 3):
		constant_force = Vector2(0, 0)
		#add_constant_central_force(down)
