extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $AudioStreamPlayer2D.playing == false:
		$AudioStreamPlayer2D.play()


func _on_key_body_entered(body):
	if body.name == "Player":
		Game.key += 1
		get_node("Key").queue_free()
		$coin.play()


func _on_key_2_body_entered(body):
	if body.name == "Player":
		get_node("Key2").queue_free()
		$coin.play()
		Game.key += 1


func _on_key_3_body_entered(body):
	if body.name == "Player":
		get_node("Key3").queue_free()
		$coin.play()
		Game.key += 1


func _on_key_4_body_entered(body):
	if body.name == "Player":
		get_node("Key4").queue_free()
		$coin.play()
		Game.key += 1
