extends CharacterBody2D

const ROTATION_SPEED = 3.0
const RADIUS = 600.0
const CENTER = Vector2.ZERO

var angle: float = PI

func _ready():
	global_position = CENTER + Vector2(cos(angle), sin(angle)) * RADIUS

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("rotate_c_clockwise", "rotate_clockwise")
	
	angle += direction * ROTATION_SPEED * delta
	global_position = CENTER + Vector2(cos(angle), sin(angle)) * RADIUS
	look_at(CENTER)
