extends Area2D

@onready var timer: Timer = $Timer 	#Hold and drag timer node

func _on_body_entered(body) -> void: #Body is the player; the entity that enters the killzone
	print("You died!")
	Engine.time_scale = 0.5 #Go half speed /
	body.get_node("CollisionShape2D").queue_free()	#Getting the collision shape node and removing it
	timer.start()		#The timer starts now

func _on_timer_timeout() -> void:	#And this code runs when the timer ends
	Engine.time_scale = 1.0 #Set speed back to default /
	get_tree().reload_current_scene()	#Reloads and restarts the game
