extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# Get size of viewport
	var viewport_size = get_viewport().size
	# Position crosshair to middle of screen
	self.rect_position = viewport_size/2 - self.rect_size/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
