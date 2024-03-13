extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()



func _on_area_2d_body_entered(body:Node2D):
	var direction = Input.get_axis("ui_left", "ui_right")
	if body.name == "Player":
		if direction > 0:
			get_node("AnimatedSprite2D").play("run")
			get_node("AnimatedSprite2D").flip_h = true
			velocity.x -= 200
		else:
			velocity.x += 200

func _on_area_2d_body_exited(body:Node2D):
	get_node("AnimatedSprite2D").play("Idle")
	velocity.x = 0

func _on_kill_body_entered(body:Node2D):
	if body.name == "Player":
		self.queue_free()

func _on_player_death_body_entered(body):
	pass



func _on_kill_player_body_entered(body):
	Game.playerHP -= 3



func _on_sec_body_entered(body):
	if body.name == "Player":
		get_node("AnimatedSprite2D").play("run")
		get_node("AnimatedSprite2D").flip_h = true
		velocity.x -= 200

func _on_kill_body_exited(body):
	velocity.x = 0
