extends CharacterBody2D
class_name Player

@export var gravity = 500
@export var speed = 150
@export var jump_force = 200
@export var max_fall_speed = 500

@onready var animated_sprite = $AnimatedSprite2D

var active = true


func _physics_process(delta):
	if !is_on_floor():
		if velocity.y < max_fall_speed:
			velocity.y += gravity * delta
	var direction = 0
	if active == true:
		if Input.is_action_just_pressed("jump") && is_on_floor():
			jump(jump_force)
		
		direction = Input.get_axis("move_left", "move_right")
		
	if direction != 0:
		animated_sprite.flip_h = (direction == -1)
	
	update_animation(direction)
	velocity.x = direction * speed
	move_and_slide()

func jump(force):
	AudioPlayer.play_sfx("jump")
	velocity.y = -force

func update_animation(direction):
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")
	
