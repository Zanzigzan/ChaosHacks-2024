extends Node2D

@export var enemy_scenes: Array[PackedScene] = []

var scroll_speed = 1800

func _ready():
	pass
	

func _process(delta):
	# Background scrolling
	$ParallaxBackground.scroll_offset.y += scroll_speed * delta
	#if $ParallaxBackground.scroll_offset.y >= 960:
		#$ParallaxBackground.scroll_offset.y = 0

func _on_enemy_spawn_timer_timeout():
	var enemy = enemy_scenes.pick_random().instantiate()
	enemy.global_position = Vector2(randf_range(50, 500), -50)
	$EnemyContainer.add_child(enemy)
