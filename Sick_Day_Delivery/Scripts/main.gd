extends Node2D

func _ready():
	$PauseMenu/Canvas.visible = false
	GlobalState.on_game_over.connect(_on_global_state_on_game_over)
	GlobalState.on_game_won.connect(_on_global_state_on_game_won)
	$HUD.visible = true
	$PauseMenu.process_mode = Node.PROCESS_MODE_ALWAYS
	$PlayerCell.process_mode = Node.PROCESS_MODE_INHERIT
	$HUD.process_mode = Node.PROCESS_MODE_INHERIT
	$GameOver.process_mode = Node.PROCESS_MODE_INHERIT

func _on_global_state_on_game_over():
	print("game over 😭")
	game_over()
	
func _on_global_state_on_game_won():
	game_won()
	
func _process(delta):
	if Input.is_action_just_pressed("game_over"):
		game_over()
	if Input.is_action_just_pressed("win"):
		game_won()

func game_won():
	$PauseMenu.process_mode = Node.PROCESS_MODE_DISABLED
	$HUD.visible = false
	$Win.win($HUD/Time/TimeAlive.text)

func game_over():
	$PauseMenu.process_mode = Node.PROCESS_MODE_DISABLED
	$PlayerCell.process_mode = Node.PROCESS_MODE_DISABLED
	$HUD.process_mode = Node.PROCESS_MODE_DISABLED
	$HUD.visible = false
	$GameOver.game_over($HUD/Time/TimeAlive.text)
