extends CharacterBody2D

@export var acceleration := 2.0
@export var max_speed := 400.0
@export var rotation_speed := 250.0

func _ready():
	$PlayerAnimation.play()


func _physics_process(delta):
	var input_vector := Vector2(0, Input.get_axis("move_forward", "move_backward"))
	
	velocity += input_vector.rotated(rotation) * acceleration
	velocity = velocity.limit_length(max_speed)
	
	if Input.is_action_pressed("rotate_right"):
		rotate(deg_to_rad(rotation_speed * delta))
	if Input.is_action_pressed("rotate_left"):
		rotate(deg_to_rad(-rotation_speed * delta))
	
	if input_vector.y == 0:
		velocity = velocity.move_toward(Vector2.ZERO, 3)
	
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if(collision.get_collider().has_method("destroy_bacteria")):
			print_debug(collision.get_collider().name)
			collision.get_collider().destroy_bacteria()
			$Dooting.play()

	if Input.is_action_just_pressed("cure"):
		if $GPUParticles2D.emitting == false:
			$GPUParticles2D.restart()
			$GPUParticles2D.emitting = true
			$Whooshing.play()
#	if Input.is_action_just_released("cure"):
#		$GPUParticles2D.emitting = false
