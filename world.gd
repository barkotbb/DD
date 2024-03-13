extends Node2D

func _ready():
	Game.playerHP = 10
	Game.key = 0

func _on_button_pressed():
	get_tree().change_scene_to_file("main.tscn")

func _process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if $AudioStreamPlayer2D.playing == false:
		$AudioStreamPlayer2D.play()
	


func _on_key_body_entered(body):
	if body.name == "Player":
		get_node("Key").queue_free()
		Game.key += 1
		$coin.play()


		
