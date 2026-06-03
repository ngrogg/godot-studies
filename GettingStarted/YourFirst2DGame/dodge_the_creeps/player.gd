extends Area2D

# Signal to define collision with enemies
signal hit

# How fast the player will move pixels/sec
@export var speed = 400

# Size of the game window
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	## Set screen size to viewport size
	screen_size = get_viewport_rect().size
	## Hide player when scene starts
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	## The Player's movement vector, set to ZERO by default
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	## Set position based on velocity and delta
	position += velocity * delta
	## Use clamp to prevent sprite from leaving the screen
	position  = position.clamp(Vector2.ZERO, screen_size)
	
	## If moving along "X" axis, play walk animation
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		### Boolean Assignment
		$AnimatedSprite2D.flip_h = velocity.x < 0
	## If moving along "Y" axis, play up animation
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0

# Function for collision signal
func _on_body_entered(body: Node2D) -> void:
	## Player disappears after being hit.
	hide()
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)

# Function to reset the player when starting a new game
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
