extends Control

signal game_started
@export var quit_scene : PackedScene
@export var controls_scene : PackedScene

func _ready():
	$Canvas.visible = true;

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_how_to_play_pressed():
	get_tree().change_scene_to_packed(controls_scene)


func _on_x_pressed():
	if OS.get_name() == "Web":
		get_tree().change_scene_to_packed(quit_scene)
	else:
		get_tree().quit()
