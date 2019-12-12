extends KinematicBody2D

var motion = Vector2()

func _physics_process(delta):
	# Set motion vector to left/right by keys
	if Input.is_action_pressed("ui_right"):
		motion.x = 100
	elif Input.is_action_pressed("ui_left"):
		motion.x = -100
	else:
		motion.x = 0
		
	# Apply gravity: 9.8m/s^2 every second
	motion.y += 9.8
		
	move_and_slide(motion)
