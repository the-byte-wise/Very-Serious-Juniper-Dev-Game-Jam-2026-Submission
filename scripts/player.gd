extends CharacterBody2D

const ROTATION_SPEED : float = 4.0
const RADIUS : float = (440.0 / 2)
const BOUNCE_FORCE : float = 700.0

var angle: float = PI

func _ready() -> void:
	global_position = Utils.center + Vector2(cos(angle), sin(angle)) * RADIUS

# Not good for collision physics,
func _physics_process(delta: float) -> void:
	var direction : float = Input.get_axis("rotate_c_clockwise", "rotate_clockwise")
	
	angle += direction * ROTATION_SPEED * delta
	global_position = Utils.center + Vector2(cos(angle), sin(angle)) * RADIUS
	
	look_at(Utils.center)
	
#func _on_ball_entered(body: Node) -> void:
	#var ball : RigidBody2D = body as RigidBody2D
	#
	#if not ball:
		#return
	#
	#%AudioStreamPlayer2D.play()
	#var direction : Vector2 = (ball.global_position - global_position).normalized()
	#ball.apply_central_impulse(direction * BOUNCE_FORCE)
