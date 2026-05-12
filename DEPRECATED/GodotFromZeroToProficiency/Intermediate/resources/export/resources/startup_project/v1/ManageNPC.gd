extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Variable for health
var health:int

# Called when the node enters the scene tree for the first time.
func _ready():
	health = 100

func got_hit():
	health -= 20
	print("Health " + str(health))
	if (health <= 0): 
		destroy_target()

func destroy_target():
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
