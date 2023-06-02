extends Node2D

var lives = 3
var score = 0

@onready var player = $Player
@onready var hud = $UI/HUD

func _ready():
	hud.set_score_label(score)
	hud.set_lives(lives)

func _on_player_took_damage():
	lives -= 1
	hud.set_lives(lives)
	if(lives < 1):
		print("Game Over")
		player.die()
	print(lives)

func _on_enemy_spawner_enemy_spawned(enemy_intance):
	enemy_intance.connect("died", _on_enemy_died)
	add_child(enemy_intance)

func _on_enemy_died():
	score += 100
	hud.set_score_label(score)

