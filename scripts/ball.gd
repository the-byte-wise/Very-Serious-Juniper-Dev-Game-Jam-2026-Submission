extends CharacterBody2D

const SPEED : float = 400.0
var angle : float = 0.0

@onready var player : CharacterBody2D = $"../player"

func _ready() -> void:
	var direction : Vector2 = global_position.direction_to(Utils.center)
	velocity = direction * SPEED

func _physics_process(delta: float) -> void:
	var collision : KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("Ball freed!")
	queue_free()
