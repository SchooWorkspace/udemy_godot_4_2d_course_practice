extends CharacterBody2D

var speed = 500

func _physics_process(delta):
	velocity = Vector2(0, 0)
	if(Input.is_action_pressed("move_right")):
		velocity.x = speed
	if(Input.is_action_pressed("move_left")):
		velocity.x = -speed
	if(Input.is_action_pressed("move_up")):
		velocity.y = -speed
	if(Input.is_action_pressed("move_down")):
		velocity.y = speed
	
	move_and_slide()
	
	global_position.x = clampf(global_position.x, 0, 1280)
	global_position.y = clampf(global_position.y, 0, 720)
