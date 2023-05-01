extends Node2D

@onready var player = get_tree().get_first_node_in_group("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var all_colonies = get_tree().get_nodes_in_group("colony")
	var colonies = []
	for colony in all_colonies:
		if colony.process_priority > 0:
			colonies.push_front(colony)
			
	if colonies.size() > 0:
		$Arrow.visible = true
		# Assuming the first is the closest only to validate in a moment
		var closest_colony = colonies[0];
		var assumed_closest_distance = 0;
		var current_bac_distance = 0;
		
		for current_colony in colonies:
			assumed_closest_distance = closest_colony.global_position.distance_to(player.global_position)
			current_bac_distance = current_colony.global_position.distance_to(player.global_position)
			
			if current_bac_distance < assumed_closest_distance:
				closest_colony = current_colony
		
		global_rotation = global_position.angle_to_point(closest_colony.global_position) + 1.5708
	else:
		$Arrow.visible = false
