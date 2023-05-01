extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var bacteria = get_tree().get_nodes_in_group("bacteria")
	
	if bacteria.size() > 0:
		$Arrow.visible = true
		# Assuming the first is the closest only to validate in a moment
		var closest_bacteria = bacteria[0];
		var assumed_closest_distance = 0;
		var current_bac_distance = 0;
		
		for current_bac in bacteria:
			assumed_closest_distance = closest_bacteria.global_position.distance_to(player.global_position)
			current_bac_distance = current_bac.global_position.distance_to(player.global_position)
			
			if current_bac_distance < assumed_closest_distance:
				closest_bacteria = current_bac
		
		global_rotation = global_position.angle_to_point(closest_bacteria.global_position) + 1.5708
		print(global_rotation)
