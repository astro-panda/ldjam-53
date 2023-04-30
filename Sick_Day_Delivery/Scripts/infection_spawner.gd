extends Timer

@export var colony_count := 1
@export_range(0, 20, 2) var spawn_rate: int
@export_range(0, 1, .025) var spawn_chance: float
@export var colony: PackedScene

var spawn_positions = [ Vector2(0,0), Vector2(50,50) ]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var colony = colony.instantiate()
	colony.position = spawn_positions[0]
	add_child(colony)
