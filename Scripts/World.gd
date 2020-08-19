extends Node2D

var score = 0 setget set_score

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func set_score(value: int) -> void:
	score = value
	get_node("Score").set_text("Pontos: " + str(score))
