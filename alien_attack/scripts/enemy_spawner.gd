extends Node2D

@onready var enemy_scene = preload("res://scenes/enemy.tscn")
@onready var spawn_positions = $SpawnPositions

func _on_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var positions_array = spawn_positions.get_children()
	var random_position = positions_array.pick_random()
	
	var enemy_instantiation = enemy_scene.instantiate()
	enemy_instantiation.global_position = random_position.global_position
	add_child(enemy_instantiation)
