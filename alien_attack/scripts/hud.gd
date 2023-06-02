extends Control

@onready var score = $Score

func set_score_label(new_score):
	score.text = "Score: " + str(new_score)
