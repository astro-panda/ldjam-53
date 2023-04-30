extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Time/TimeAlive/Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func display_enemies_destroyed(total):
	$EnemyCounter/Count.set_text(str(total))
