extends Sprite2D

var frames = texture.get_width() / region_rect.size.x

func ready():
	var rand_index = randi_range(0, frames -1)
	region_rect.position.x = rand_index * region_rect.size.x
