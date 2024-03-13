extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_retry_pressed():
	Game.playerHP == 12
	get_tree().change_scene_to_file("world.tscn")


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("main.tscn")
