extends Area2D

'''Notes:
Set the GameManager to unique(%) so that the variable would access the node with its unique
identifier rather than a fixed path. 
Downside: nodes have to be on the same scene to connect'''

@onready var game_manager: Node = %GameManager	


func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point()
	queue_free()	#Remove the coin/ node
