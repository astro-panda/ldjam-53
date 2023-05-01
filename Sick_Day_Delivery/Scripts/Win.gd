extends Control

@export var quit_scene : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	$Canvas.visible = false

func win(time):
	$Yay.play()
	$Canvas/Message.text = "Bacterium Killed: %d\nColonies Destroyed: %d\nElapsed Time: %s" %[GlobalState.enemies_destroyed, GlobalState.colonies_destroyed, time]
	$Canvas.visible = true
	get_tree().paused = true


func _on_play_again_pressed():
	GlobalState.reset_state()
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_pressed():
	if OS.get_name() == "Web":
		get_tree().change_scene_to_packed(quit_scene)
	else:
		get_tree().quit()
