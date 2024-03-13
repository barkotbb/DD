extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("CanvasLayer/err").set_visible(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		if Game.key <= 3:
			get_node("CanvasLayer/err").set_visible(true)
			get_node("CanvasLayer/err").text = str("You need at least 4 keys.")
		else:
			self.queue_free()
			Game.key -= 4


func _on_area_2d_body_exited(body):
	get_node("CanvasLayer/err").set_visible(false)
