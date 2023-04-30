extends Node

signal on_enemies_destroyed_updated (total)

@export var enemies_destroyed := 0


func report_enemy_destroyed():
	enemies_destroyed += 1
	emit_signal("on_enemies_destroyed_updated", enemies_destroyed)
