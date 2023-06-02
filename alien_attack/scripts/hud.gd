extends Control

@onready var score = $Score
@onready var life_left = $LivesLeft

func set_score_label(new_score):
	score.text = "Score: " + str(new_score)

func set_lives(amount):
	life_left.text = str(amount)
