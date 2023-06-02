extends Node2D

var lives = 3
var scores = 0

@onready var player = $Player

func _on_player_took_damage():
	lives -= 1
	if(lives < 1):
		print("Game Over")
		player.die()
	print(lives)

func _on_enemy_spawner_enemy_spawned(enemy_intance):
	enemy_intance.connect("died", _on_enemy_died)
	add_child(enemy_intance)

func _on_enemy_died():
	scores += 100
	print("Scores: " + str(scores))
