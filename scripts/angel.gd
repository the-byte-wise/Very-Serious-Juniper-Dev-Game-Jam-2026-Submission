extends Area2D

func _ready() -> void:
	pass 

func _process(_delta: float) -> void:
	pass

func _on_body_entered(_body: Node2D) -> void:
	print("GAME OVER!")
