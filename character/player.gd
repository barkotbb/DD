extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const JUMP_VELOCITY_WHILE_TRUE = 400.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 1000

@onready var animated_sprite = get_node("AnimatedSprite2D")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		get_node("AnimatedSprite2D").play("jump")

	# Handle jump.
	if Game.gravity_bool == false:
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
	elif Game.gravity_bool == true:
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY_WHILE_TRUE

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	
	if velocity.x > 0:
		animated_sprite.play("run")
		animated_sprite.flip_h = false
	elif velocity.x < 0:
		animated_sprite.play("run")
		animated_sprite.flip_h = true
	else:
		animated_sprite.play("Idle")
		animated_sprite.flip_h = false
	
	
	if Input.is_action_just_pressed("gravity_invert"):
		if Game.gravity_bool == false:
			gravity = -1000
			Game.gravity_bool = true
			
		else:
			gravity = 1000
			Game.gravity_bool = false


	move_and_slide()
	
	if Game.playerHP <= 0:
		get_tree().change_scene_to_file("gameover.tscn")
