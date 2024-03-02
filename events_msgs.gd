extends CanvasLayer

#used to signal program to display event message
signal eventMsg

# Called when the node enters the scene tree for the first time.
func _ready():
	show_message("AHHH","Speed Up by 5%")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#call this function 
func show_message(event, eventDescription):
	$eventTitle.text=event
	$eventDescription.text=eventDescription
	$eventTitle.show()
	$eventDescription.show()
	$msgTimer.start()


func _on_msg_timer_timeout():
	$eventTitle.hide()
	print("I ran")
	pass # Replace with function body.