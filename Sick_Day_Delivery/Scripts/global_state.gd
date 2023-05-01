extends Node

signal on_enemies_count_updated (total)
signal on_colony_count_updated (total)
signal on_enemies_destroyed (total)
signal on_colonies_destroyed (total)
signal on_game_over

@export var enemies_destroyed := 0
@export var colonies_destroyed := 0
@export var enemies_max := 0

var total_enemies = 0
var total_colonies = 0

func report_enemy_destroyed():
	enemies_destroyed += 1
	total_enemies -= 1
	emit_signal("on_enemies_count_updated", total_enemies)
	emit_signal("on_enemies_destroyed", enemies_destroyed)

func report_enemy_created():
	total_enemies += 1
	emit_signal("on_enemies_count_updated", total_enemies)

	if total_enemies >= enemies_max:
		emit_signal("on_game_over")

func report_colony_created():
	total_colonies += 1
	emit_signal("on_colony_count_updated", total_colonies)
	
func report_colony_destroyed():
	colonies_destroyed += 1
	total_colonies -= 1
	emit_signal("on_colonies_destroyed", colonies_destroyed)
	emit_signal("on_colony_count_updated", total_colonies)
