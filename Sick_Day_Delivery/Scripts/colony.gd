extends Area2D

signal enemy_spawn

@export var bacteria_max := 100
@export_range(0, 20, 2) var spawn_rate: int
@export_range(0, 1, .025) var spawn_chance: float
@export var bacteriumScene: PackedScene
@onready var bacteria = get_tree().get_first_node_in_group("BacteriaGroup")

var colliding = false
var colony_ded = false
var default_children

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColonyAnimation.play("Blink")
	GlobalState.report_colony_created()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
func createBacterium():
	if bacteria_max > bacteria.get_children().size():
		var bacterium = bacteriumScene.instantiate()
		bacterium.position = self.position
		bacteria.add_child(bacterium)

func _on_colony_timer_timeout():
	createBacterium()

func destroy_colony():
	process_priority = 0
	colony_ded = true
	$ColonyAnimation.hide()
	await GlobalState.report_colony_destroyed()
	$DeathTimer.start()
	
func _on_death_timer_timeout():
	queue_free()
