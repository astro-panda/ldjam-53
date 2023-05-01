extends Control

@export var quit_scene : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	$Canvas.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func game_over(time):
	$Canvas/Message.text = "Bacterium Killed: %d\nColonies Destroyed: %d\nElapsed Time: %s" %[GlobalState.enemies_destroyed, GlobalState.colonies_destroyed, time]
	$Canvas.visible = true


func _on_play_again_pressed():
	get_tree().reload_current_scene()


func _on_quit_pressed():
	if OS.get_name() == "Web":
		get_tree().change_scene_to_packed(quit_scene)
	else:
		get_tree().quit()
