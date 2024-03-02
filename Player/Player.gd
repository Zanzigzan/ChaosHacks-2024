class_name Player extends CharacterBody2D

const max_speed = 400
const accel = 3000
const friction = 5000

var input = Vector2.ZERO
func _physics_process(delta):
	player_movement(delta)
	
func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	#print("x", input.x)
	#print("y", input.y)
	return input.normalized()

	
func player_movement(delta):
	input= get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)
	move_and_slide()

func die()
	print("x")
 
