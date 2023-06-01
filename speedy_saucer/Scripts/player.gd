extends RigidBody2D

var speed = 1000

func _ready():
	# apply_impulse(Vector2(20,5))
	pass

func _process(delta):
	pass

func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		apply_force(Vector2(speed, 0))
	if Input.is_action_pressed("move_left"):
		apply_force(Vector2(-speed, 0))
	if Input.is_action_pressed("move_down"):
		apply_force(Vector2(0, speed))
	if Input.is_action_pressed("move_up"):
		apply_force(Vector2(0, -speed))
