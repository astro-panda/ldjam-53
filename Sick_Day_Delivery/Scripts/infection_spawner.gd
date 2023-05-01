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
	var child_count = 0
	for child in $Colonies.get_children():
		if child.process_priority != 0:
			child_count += 1
	if child_count < colony_max:
		var colony = colonyScene.instantiate()
		var current_colony_name = spawns[0].name
		while current_colony_name == spawns[0].name:
			spawns.shuffle()
		print_debug(spawns[0].name + ": " + str(spawns[0].position))
		colony.process_priority = 1
		colony.position = spawns[0].position
		$Colonies.add_child(colony)		
