extends Node2D
var canToggle=true

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			resume()
		else:
			pause()

func pause():
	if canToggle:
		get_tree().set_deferred("paused",true)
		
func resume():
	if canToggle:
		get_tree().set_deferred("paused",false)

