extends Node2D

#Variables
const SPEED = 60
var direction = 1 #Default value
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


''' Notes:
-Process runs every frame overtime. 
-Delta is the amount of time gone by the last frame/elapsed time since the previous frame.
-Higher frame rate, slower delta, lower frame rate, faster/higher delta
-RayCast node invisible rays that we can shoot out to detect collisions'''


func _process(delta: float) -> void:
	#Before we move the slime, we check whether there is a collision ahead.
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true	#flip the animation to face the other side
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	position.x += direction * SPEED * delta #Get the x position and add 1 pixel per frame
