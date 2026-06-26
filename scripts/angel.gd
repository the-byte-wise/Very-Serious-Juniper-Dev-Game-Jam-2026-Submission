extends Area2D

signal lose_life

func _ready() -> void:
	pass 

func _process(_delta: float) -> void:
	pass

func _on_body_entered(_body: Node2D) -> void:
	_body.queue_free()
	%AudioStreamPlayer2D.play()
	lose_life.emit()
