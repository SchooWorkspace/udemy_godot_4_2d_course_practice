extends CharacterBody2D

@export var gravity = 500

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	velocity.y += 500 * delta
	
	move_and_slide()
