class_name Enemy extends Area2D
#
@export var speed = 500
var is_wiggling = false
var wiggle_amount = .5  # Adjust for more or less wiggle
var wiggle_speed = 10 # Lower is faster, higher is slower
var wiggle_timer = 0
var crash = false
func _ready():
	pass

func _process(delta):
	global_position.y += speed * delta
	
	if is_wiggling:
		wiggle_timer += 1
		if wiggle_timer % wiggle_speed == 0:
			rotation += wiggle_amount
			wiggle_amount *= -1  # Change direction
	if crash:
		rotation += 0.1

func _on_body_entered(body):
	if body is Player:
		body.die()
	die()

func set_wiggling(wiggling):
	is_wiggling = wiggling
	
func die():
	crash = true
	$Crash.play()
	await get_tree().create_timer(1).timeout
	queue_free()
