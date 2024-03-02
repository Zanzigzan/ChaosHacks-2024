extends Node2D

var scroll_speed = 1800

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxBackground.scroll_offset.y += scroll_speed * delta
	if $ParallaxBackground.scroll_offset.y >= 960:
		$ParallaxBackground.scroll_offset.y = 0


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
