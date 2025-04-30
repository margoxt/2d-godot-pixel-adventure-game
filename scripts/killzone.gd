extends Area2D

@onready var timer: Timer = $Timer 	#Hold and drag timer node

func _on_body_entered(body) -> void:
	print("You died!")
	timer.start()		#The timer starts now

func _on_timer_timeout() -> void:	#And this code runs when the timer ends
	get_tree().reload_current_scene()	#Reloads and restarts the game
