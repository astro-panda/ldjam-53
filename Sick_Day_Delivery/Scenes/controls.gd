extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func return_to_menu():
	get_tree().change_scene_to_file("res://Scenes/StartMenu.tscn")


func _on_button_pressed():
	return_to_menu()
