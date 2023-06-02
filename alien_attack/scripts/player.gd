extends CharacterBody2D

var speed = 500
var rocket_scene = preload("res://scenes/rocket.tscn")
var rocket_container

func _ready():
	rocket_container = get_node("RocketContainer")

func _process(delta):
	if(Input.is_action_just_pressed("shoot")):
		shoot()

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
	
	global_position = global_position.clamp(Vector2(0,0), get_viewport_rect().size)

func shoot():
	var rocket_int = rocket_scene.instantiate()
	rocket_container.add_child(rocket_int)
	rocket_int.global_position = global_position
	rocket_int.global_position.x += 50
