extends Control

@export var quit_scene : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	$Canvas.visible = true;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !get_tree().paused
		if (get_tree().paused):
			$Canvas.visible = true;
		else:
			$Canvas.visible = false;
		
	
func _on_quit_pressed():
	if OS.get_name() == "Web":
		get_tree().change_scene_to_packed(quit_scene)
	else:
		get_tree().quit()

func _on_restart_pressed():
	get_tree().reload_current_scene()


func _on_resume_pressed():
	$Canvas.visible = false;
	get_tree().paused = false
