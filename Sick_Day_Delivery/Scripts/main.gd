extends Node2D

func _ready():
	$PauseMenu/Canvas.visible = false
	GlobalState.on_game_over.connect(_on_global_state_on_game_over)
	$HUD.visible = true
	$PauseMenu.process_mode = Node.PROCESS_MODE_ALWAYS
	$PlayerCell.process_mode = Node.PROCESS_MODE_INHERIT
	$HUD.process_mode = Node.PROCESS_MODE_INHERIT
	$GameOver.process_mode = Node.PROCESS_MODE_INHERIT

func _on_global_state_on_game_over():
	print("game over 😭")
	game_end()
	$GameOver.game_over($HUD/Time/TimeAlive.text)
	
func _process(delta):
	if Input.is_action_just_pressed("game_over"):
		game_end()
		$GameOver.game_over($HUD/Time/TimeAlive.text)
	if Input.is_action_just_pressed("win"):
		$PauseMenu.process_mode = Node.PROCESS_MODE_DISABLED
		$Win.win($HUD/Time/TimeAlive.text)

func game_end():
	$PauseMenu.process_mode = Node.PROCESS_MODE_DISABLED
	$PlayerCell.process_mode = Node.PROCESS_MODE_DISABLED
	$HUD.process_mode = Node.PROCESS_MODE_DISABLED
	$HUD.visible = false
