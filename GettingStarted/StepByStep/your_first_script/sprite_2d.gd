extends Sprite2D

# Member Variables
## Speed variable 
var speed         = 400
## Angular speed for rotation, set to PI
var angular_speed = PI 

func _process(delta):	
	## variable for direction along X axis
	#var direction = 0
	
	## If statements for setting direction variable based on user input
	#if Input.is_action_pressed("ui_left"):
	#	direction = -1
	#if Input.is_action_pressed("ui_right"):
	#	direction = 1
	
	## Calculate rotation based on angular speed and delta 
	#rotation     += angular_speed * direction * delta
	rotation     += angular_speed * delta
	
	## Variable for velocity
	## Vector2.UP is a constant 
	## Vector pointed relative to icon
	var velocity  = Vector2.UP.rotated(rotation) * speed
	
	## Variable for velocity
	## Vector2.ZERO is a constant
	#var velocity   = Vector2.ZERO
	
	## If statement to set velocity when player presses up 
	#if Input.is_action_pressed("ui_up"):
	#	velocity   = Vector2.UP.rotated(rotation) * speed
	
	## Variable for position
	position     += velocity * delta

#func _init():
#	print("Hello, World!")


func _on_button_pressed() -> void:
	set_process(not is_processing())

func _on_timer_timeout():
	## Bool for node visibility
	visible = not visible

func _ready():
	var timer     = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)
