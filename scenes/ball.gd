extends CharacterBody2D

const SPEED = 600.0
const CENTER = Vector2.ZERO

var angle := 0

func _ready() -> void:
	velocity = Vector2(-1, 0).normalized() * SPEED

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()
