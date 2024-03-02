extends Node2D

var scroll_speed = 1800

func _ready():
	pass # Replace with function body.


func _process(delta):
	# Background scrolling
	$ParallaxBackground.scroll_offset.y += scroll_speed * delta
	if $ParallaxBackground.scroll_offset.y >= 960:
		$ParallaxBackground.scroll_offset.y = 0
