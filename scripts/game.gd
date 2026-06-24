extends Node2D

func spawn_ball() -> void:
	var new_ball : Node = preload("res://scenes/ball.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_ball.global_position = $%PathFollow2D.global_position
	add_child(new_ball)

func _on_timer_timeout() -> void:
	spawn_ball()
