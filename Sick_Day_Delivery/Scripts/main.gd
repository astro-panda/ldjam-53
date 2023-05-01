extends Node2D

func _ready():
	$PauseMenu/Canvas.visible = false
	GlobalState.on_game_over.connect(_on_global_state_on_game_over)
	$HUD.visible = true

func _on_global_state_on_game_over():
	print("game over 😭")
	get_tree().paused = true
	
func _process(delta):
	if Input.is_action_just_pressed("game_over"):
		$PauseMenu.process_mode = Node.PROCESS_MODE_DISABLED
		$PlayerCell.process_mode = Node.PROCESS_MODE_DISABLED
		$HUD.visible = false
		$GameOver.game_over($HUD/Time/TimeAlive.text)
