extends Area2D

@export var speed = 2

func _physics_process(delta):
	global_position.x += speed
	print(String(Engine.get_frames_per_second()))
