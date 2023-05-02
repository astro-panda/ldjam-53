extends CharacterBody2D

@export var cureScene: PackedScene

@export var acceleration: float = 2.0
@export var max_speed: float = 400.0
@export var rotation_speed: float = 250.0
@export var decceleration: float = .01


func _ready():
	$PlayerAnimation.play()

func _physics_process(delta):
	var input_vector = Vector2(0, Input.get_axis("move_forward", "move_backward"))	
	
	if Input.is_action_pressed("brake"):
		velocity = velocity.lerp(Vector2.ZERO, decceleration)

	velocity += input_vector.normalized().rotated(rotation) * acceleration
	velocity = velocity.limit_length(max_speed)
	
	if Input.is_action_pressed("rotate_right"):
		rotate(deg_to_rad(rotation_speed * delta))
	if Input.is_action_pressed("rotate_left"):
		rotate(deg_to_rad(-rotation_speed * delta))

	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if(collision.get_collider().has_method("destroy_bacteria")):
			collision.get_collider().destroy_bacteria()
			$Dooting.play()

	if Input.is_action_just_pressed("cure"):
			var cure = cureScene.instantiate()
			cure.position = self.position
			get_tree().get_first_node_in_group("Cure").add_child(cure)
			$Whooshing.play()
#	if Input.is_action_just_released("cure"):
#		$GPUParticles2D.emitting = false


func _on_cure_timer_timeout():
	$CureArea2D.visible = false


