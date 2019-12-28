extends Node2D

var score = 0 setget set_score
var lives = 3 setget set_life
var game_over = false

func set_score(value):
	score = value
	get_node("Score").set_text("Score: " + str(value))

func set_life(value):
	lives = value
	get_node("Lives").set_text("Lives: " + str(value))
	
	