extends Timer

@export var bacteria_count := 1
@export_range(0, 20, 2) var spawn_rate: int
@export_range(0, 1, .025) var spawn_chance: float
@export var bacteriumScene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func createBacterium():
	var bacterium = bacteriumScene.instantiate()
	bacterium.position = self.position
	add_child(bacterium)
