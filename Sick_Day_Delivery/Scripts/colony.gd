extends Area2D

signal enemy_spawn

@export var bacteria_max := 100
@export_range(0, 20, 2) var spawn_rate: int
@export_range(0, 1, .025) var spawn_chance: float
@export var bacteriumScene: PackedScene

var colliding = false
var colony_ded = false
var default_children

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColonyAnimation.play("Blink")
	GlobalState.report_colony_created()
	default_children = self.get_children().size()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("cure") && colliding && !colony_ded:
		colony_ded = true
		$ColonyAnimation.hide()
		process_priority = 0
	if self.get_children().size() <= default_children && process_priority == 0:
		print_debug("colony destroyed")
		destroy_colony()
		queue_free()
		
func createBacterium():
	if process_priority > 0 && get_children().size() -3 < bacteria_max:
		var bacterium = bacteriumScene.instantiate()
		bacterium.position = Vector2.ZERO
		add_child(bacterium)

func _on_colony_timer_timeout():
	
	createBacterium()

func destroy_colony():
	await GlobalState.report_colony_destroyed()
	$DeathTimer.start()
	
func _on_body_entered(body):
	if body.is_in_group("Player"):
		colliding = true

func _on_body_exited(body):
	if body.is_in_group("Player"):
		colliding = false


func _on_death_timer_timeout():
	queue_free()
