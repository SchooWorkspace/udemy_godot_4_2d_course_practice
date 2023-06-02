extends Node2D

var lives = 3
var score = 0

@onready var player = $Player
@onready var hud = $UI/HUD

@onready var enemy_hit_sound = $EnemyHitSound
@onready var player_explode_sound = $PlayerExplodeSound

var game_over_scene = preload("res://scenes/game_over_screen.tscn")

func _ready():
	hud.set_score_label(score)
	hud.set_lives(lives)

func _on_player_took_damage():
	lives -= 1
	hud.set_lives(lives)
	if(lives < 1):
		print("Game Over")
		player_explode_sound.play()
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		var game_over_scene_instantiation = game_over_scene.instantiate()
		$UI.add_child(game_over_scene_instantiation)
		game_over_scene_instantiation.set_score(score)


func _on_enemy_spawner_enemy_spawned(enemy_intance):
	enemy_intance.connect("died", _on_enemy_died)
	add_child(enemy_intance)


func _on_enemy_died():
	enemy_hit_sound.play()
	score += 100
	hud.set_score_label(score)

