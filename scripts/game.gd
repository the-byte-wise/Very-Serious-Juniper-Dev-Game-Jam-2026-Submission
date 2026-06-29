extends Node2D

@onready var spawn_path_follow : PathFollow2D

var lives : int = 5
var round_time : float = 181 # add the extra second so player can see the 3:00

func spawn_ball() -> void:
	var new_ball : Node = preload("res://scenes/ball.tscn").instantiate()
	%spawn_path_follow.progress_ratio = randf()
	new_ball.global_position = %spawn_path_follow.global_position
	add_child(new_ball)
	
func update_on_screen_time() -> void:
	var time_left : float = %game_timer.time_left
	var minutes : int = int(time_left / 60.0)
	var seconds : int = int(time_left - (minutes * 60))
	
	%minutes_ones.change_number(minutes)
	%seconds_tens.change_number(int(seconds / 10))
	%seconds_ones.change_number(int(seconds % 10))
	
func update_progress_bar() -> void:
	var seconds_elapsed : int = int(round_time - %game_timer.time_left) 
	%progress_bar.size = Vector2(int((seconds_elapsed / round_time) * 390), %progress_bar.size.y)

func update_lives() -> void:
	if lives == 4:
		%life5.change_number(10)
	elif lives == 3:
		%life4.change_number(10)
	elif lives == 2:
		%life3.change_number(10)
	elif lives == 1:
		%life2.change_number(10)

func _ready() -> void:
	%life1.change_number(11)
	%life2.change_number(11)
	%life3.change_number(11)
	%life4.change_number(11)
	%life5.change_number(11)
	%game_timer.start(round_time)
	
func _process(_delta : float) -> void:
	update_on_screen_time()
	update_progress_bar()
	update_lives()
	if lives <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	#if Input.is_key_pressed(KEY_G):
		#lives = 999
		#%life1.change_number(9)
		#%life2.change_number(9)
		#%life3.change_number(9)

func _on_ball_spawner_timeout() -> void:
	spawn_ball()

func _on_bgm_finished() -> void:
	%bgm.play()

func _on_angel_lose_life() -> void:
	lives -= 1

func _on_game_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/win_screen.tscn")
