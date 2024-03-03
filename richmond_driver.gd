extends Area2D
	
var time = 0
var turn = true
var is_wiggling = false
var wiggle_amount = .2  # Adjust for more or less wiggle
var wiggle_speed = 10 # Lower is faster, higher is slower
var wiggle_timer = 0

@export var speed = 200

func _ready():
	$RM.play()

func _physics_process(delta):
	global_position.y -= speed * delta
	
	if (turn):
		global_position.x -= speed * delta
	else:
		global_position.x += speed * delta

func _process(delta):
	time += delta
	
	if is_wiggling:
		wiggle_timer += 1
		if wiggle_timer % wiggle_speed == 0:
			rotation += wiggle_amount
			wiggle_amount *= -1


func _on_timer_timeout():
	turn = not turn



func _on_area_entered(area):
	if area is Enemy:
		area.die()


func _on_body_entered(body):
	if body is Player:
		body.die()

func set_wiggling(wiggling):
	is_wiggling = wiggling
