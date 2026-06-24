extends Node2D

@onready var spawn_path_follow : PathFollow2D

func spawn_ball() -> void:
	var new_ball : Node = preload("res://scenes/ball.tscn").instantiate()
	%spawn_path_follow.progress_ratio = randf()
	new_ball.global_position = %spawn_path_follow.global_position
	add_child(new_ball)

func _on_ball_spawner_timeout() -> void:
	spawn_ball()
