extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Time/TimeAlive/Timer.start()
	GlobalState.on_enemies_destroyed.connect(display_enemies_destroyed)
	GlobalState.on_colonies_destroyed.connect(display_colonies_destroyed)
	$SepticMeter/ProgressBar.max_value = GlobalState.enemies_max
	$SepticMeter/ProgressBar.step = GlobalState.enemies_max / 100.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$SepticMeter/ProgressBar.value = GlobalState.total_enemies
	
func display_enemies_destroyed(total):
	$EnemyCounter/Count.set_text(str(total))
	
func display_colonies_destroyed(total):
	$ColonyCounter/Count.set_text(str(total))
