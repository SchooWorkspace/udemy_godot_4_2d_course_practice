extends Node2D

@onready var enemy_scene = preload("res://scenes/enemy.tscn")
@onready var path_enemy_scene = preload("res://scenes/path_enemy.tscn")
@onready var spawn_positions = $SpawnPositions

signal enemy_spawned(enemy_intance)
signal path_enemy_spawned(path_enemy_instance)

func _on_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var positions_array = spawn_positions.get_children()
	var random_position = positions_array.pick_random()
	var enemy_instantiation = enemy_scene.instantiate()
	
	enemy_instantiation.global_position = random_position.global_position
	emit_signal("enemy_spawned", enemy_instantiation)
	#add_child(enemy_instantiation)


func _on_timer_2_timeout():
	spawn_path_enemy()
	
func spawn_path_enemy():
	var path_enemy_instantiation = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned", path_enemy_instantiation)
