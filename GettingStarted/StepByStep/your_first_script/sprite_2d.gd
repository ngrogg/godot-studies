extends Sprite2D

# Member Variables
## Speed variable 
var speed         = 400
## Angular speed for rotation, set to PI
var angular_speed = PI 

func _process(delta):	
	### Calculate rotation based on angular speed and delta 
	rotation    += angular_speed * delta
	
	### Variable for velocity
	### Vector2.UP is a constant 
	### Vector pointed relative to icon
	var velocity = Vector2.UP.rotated(rotation) * speed
	
	### Variable for position
	position    += velocity * delta

#func _init():
#	print("Hello, World!")
