class_name Player extends CharacterBody2D

const max_speed = 600
const accel = 3000
const friction = 5000
var crash = false
var screen_size

func start(pos):
	position = pos
	

func _ready():
	screen_size = get_viewport_rect().size
	$CarStart.play()
	$SoundTrack.play()
	
var input = Vector2.ZERO
func _physics_process(delta):
	player_movement(delta)
	if Input.is_action_just_pressed("ui_horn"):
		$CarHorn.play()
func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	#print("x", input.x)
	#print("y", input.y)
	return input.normalized()



func player_movement(delta):
	input= get_input()
	#print(crash)
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)
	if crash:
		rotation -= 0.5
		
	position = position.clamp(Vector2(200, 0), screen_size - Vector2(200, 0))
	move_and_slide()

func die():
	crash = true
	$SoundTrack.stop()
	$Crash.play()
	await get_tree().create_timer(1).timeout
	queue_free()
