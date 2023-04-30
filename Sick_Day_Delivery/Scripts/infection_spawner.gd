extends Timer

@export var colony_max := 1
@export_range(0, 20, 2) var spawn_rate: int
@export_range(0, 1, .025) var spawn_chance: float
@export var colonyScene: PackedScene

@onready var spawns = $SpawnPoints.get_children()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func createColony():
	if $Colonies.get_children().size() < colony_max:
		var colony = colonyScene.instantiate()
		print_debug(spawns[0].position)
		colony.position = spawns[0].position
		$Colonies.add_child(colony)
