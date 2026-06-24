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
	
func _on_ball_entered(body: Node) -> void:
	var ball : RigidBody2D = body as RigidBody2D
	
	if not ball:
		return
	
	var direction : Vector2 = (ball.global_position - global_position).normalized()
	ball.apply_central_impulse(direction * BOUNCE_FORCE)

# Not good for keeping the paddle on the circle but does the physics math automatically	
#func _physics_process(delta: float) -> void:
	#var offset = global_position - CENTER
	#var distance = offset.length()
	#
	#var input = Input.get_axis("rotate_c_clockwise", "rotate_clockwise")
	#
	#var tangent = Vector2(-offset.y, offset.x).normalized()
	#velocity = tangent * input * ROTATION_SPEED * RADIUS
	#
	## Readjust if a collision pushes the paddle away from the circle
	#if distance > 0:
		#var radial_dir = offset / distance
		#velocity += radial_dir * (distance - RADIUS) * -10.0 * delta
	#
	#move_and_slide()
	#look_at(CENTER)
