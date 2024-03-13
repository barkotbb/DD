extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		if Game.key <= 0:
			get_node("CanvasLayer/Label").set_visible(true)
			get_node("CanvasLayer/Label").text = str("You need a key to unlock the door")
		else:
			self.queue_free()
			Game.key -= 1

func _on_area_2d_body_exited(body):
	get_node("CanvasLayer/Label").hide()
