extends RigidBody2D

export var speed_increment: int = 15
export var max_speed: int = 600


func _ready() -> void:
	set_physics_process(true)


func _physics_process(_delta: float) -> void:
	var colliding_bodies = get_colliding_bodies()

	for body in colliding_bodies:
		if body.is_in_group('bricks'):
			get_node("/root/World").score += 5
			body.queue_free()

		if body.get_name() == 'Paddle':
			handle_paddle_collision(body)

	if get_position().y > get_viewport_rect().end.y:
		queue_free()


func handle_paddle_collision(body: KinematicBody2D) -> void:
	var current_velocity: float = get_linear_velocity().length()

	var direction = get_position() - body.get_node('Anchor').get_global_position()
	var new_velocity = direction.normalized() * min(current_velocity + speed_increment, max_speed)
	print('New velocity: ', new_velocity)

	set_linear_velocity(new_velocity)
