extends CharacterBody2D

var speed = 100

func _physics_process(delta):
	if(Input.is_action_pressed("move_right")):
		velocity = Vector2(speed, 0)
		move_and_slide()
	if(Input.is_action_pressed("move_left")):
		velocity = Vector2(-speed, 0)
		move_and_slide()
	if(Input.is_action_pressed("move_up")):
		velocity = Vector2(0, -speed)
		move_and_slide()
	if(Input.is_action_pressed("move_down")):
		velocity = Vector2(0, speed)
		move_and_slide()
	
