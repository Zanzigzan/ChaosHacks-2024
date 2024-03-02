extends Node2D

@export var enemy_scenes: Array[PackedScene] = []

var scroll_speed = 1800
var countEvent = 0

var screen_size

func start(pos):
	position = pos


func _ready():
	$EventTimer.start()
	
	screen_size = get_viewport_rect().size
	

func _process(delta):
	# Background scrolling
	$ParallaxBackground.scroll_offset.y += scroll_speed * delta
	#if $ParallaxBackground.scroll_offset.y >= 960:
		#$ParallaxBackground.scroll_offset.y = 0

func _on_enemy_spawn_timer_timeout():
	var enemy = enemy_scenes.pick_random().instantiate()
	enemy.global_position = Vector2(randf_range(240, 480), -50)
	$EnemyContainer.add_child(enemy)
	
	

func _on_event_timer_timeout():
	if countEvent == 0: 
		$EventsMsgs.show_message("SNOWFALL!!!!", "Cars slowed by 50%")
		countEvent += 1
		
	elif countEvent == 1:
		$EventsMsgs.show_message("RICHMOND DRIVER!!!!", "BE AWARE!!!")
		countEvent += 1
	elif countEvent == 2:
		$EventsMsgs.show_message("CAUTION: ACIDENT AHEAD", "Transit!")
	else:
		$EventsMsgs.show_message("SNOW AND RICHMOND DRIVER!!!!", "CHAOOOS!!!")
		
	
