extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY_ACCEL = 9.8
const MOTION_SPEED = 100
const JUMP_ACCEL = 320

var motion = Vector2()

func _physics_process(delta):
	# Set motion vector to left/right by keys
	if Input.is_action_pressed("ui_right"):
		motion.x = MOTION_SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -MOTION_SPEED
	else:
		motion.x = 0
		
	
	# Apply gravity: 9.8m/s^2 every second when we are not touching a floor
	if is_on_floor():
		# Allow to jump when on the floor
		if Input.is_action_just_pressed("ui_up"):
			motion.y -= JUMP_ACCEL
	else:
		motion.y += GRAVITY_ACCEL
		
	motion = move_and_slide(motion, UP)
