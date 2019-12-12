extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()

func _physics_process(delta):
	# Set motion vector to left/right by keys
	if Input.is_action_pressed("ui_right"):
		motion.x = 100
	elif Input.is_action_pressed("ui_left"):
		motion.x = -100
	else:
		motion.x = 0
		
	
	# Apply gravity: 9.8m/s^2 every second when we are not touching a floor
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += 9.8
		
	move_and_slide(motion, UP)
