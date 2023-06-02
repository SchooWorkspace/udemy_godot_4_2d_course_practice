extends Node2D

var lives = 3

@onready var player = $Player

func _on_player_took_damage():
	lives -= 1
	if(lives < 1):
		print("Game Over")
		player.die()
	print(lives)

