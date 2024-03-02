extends Area2D
	
var time = 0
var turn = true

@export var speed = 200

func _physics_process(delta):
	global_position.y -= speed * delta
	
	if (turn):
		global_position.x -= speed * delta
	else:
		global_position.x += speed * delta

func _process(delta):
	time += delta


func _on_timer_timeout():
	turn = not turn


func _on_body_entered(body):
	if body is Player:
		body.die()
	if body is Enemy:
		body.die()
