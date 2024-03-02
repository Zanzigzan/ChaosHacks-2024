class_name Enemy extends Area2D
#
@export var speed = 500
var is_wiggling = false
var wiggle_amount = .5  # Adjust for more or less wiggle
var wiggle_speed = 10 # Lower is faster, higher is slower
var wiggle_timer = 0

func _ready():
	pass

func _process(delta):
	global_position.y += speed * delta

	if is_wiggling:
		wiggle_timer += 1
		if wiggle_timer % wiggle_speed == 0:
			rotation += wiggle_amount
			wiggle_amount *= -1  # Change direction


func _on_body_entered(body):
	if body is Player:
		body.die()
	queue_free()

func set_wiggling(wiggling):
	is_wiggling = wiggling
