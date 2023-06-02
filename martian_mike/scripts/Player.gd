extends CharacterBody2D

@export var gravity = 500
@export var speed = 150
@export var jump_force = 200

@export var max_fall_speed = 500

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if !is_on_floor():
		if velocity.y < max_fall_speed:
			velocity.y += gravity * delta
	elif Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force
	
	var direction = Input.get_axis("move_left", "move_right")
	
	velocity.x = direction * speed
	move_and_slide()
