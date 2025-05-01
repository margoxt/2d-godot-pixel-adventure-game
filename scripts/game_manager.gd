extends Node

#Variables
var score = 0
@onready var score_label: Label = $ScoreLabel

#Function to add and display the score
func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins!"	#Made score a string
