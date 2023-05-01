extends Node2D

func _ready():
	$PauseMenu/Canvas.visible = false
	GlobalState.on_game_over.connect(_on_global_state_on_game_over)


func _on_global_state_on_game_over():
	print("game over 😭")
	get_tree().paused = true
