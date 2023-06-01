extends Node2D


func _ready():
	# print("Hello, world!")
	pass


func _on_maze_body_exited(body):
	get_tree().reload_current_scene()
