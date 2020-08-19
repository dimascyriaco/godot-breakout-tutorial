extends KinematicBody2D

const Ball = preload('res://Components/Ball.tscn')


func _ready() -> void:
	set_physics_process(true)
	set_process_input(true)


func _physics_process(_delta) -> void:
	var fixed_y_position = position.y

	var mouse_x_position = get_viewport().get_mouse_position().x

	set_position(Vector2(mouse_x_position, fixed_y_position))


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		var ball: RigidBody2D = Ball.instance()
		ball.set_position(get_position() - Vector2(0, 16))
		get_tree().get_root().add_child(ball)
