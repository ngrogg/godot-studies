extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	## Define an array based on the available sprite names "walk", "fly", and "swim"
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	## Pick a mob type at random
	$AnimatedSprite2D.animation = mob_types.pick_random()
	## Play the chosen animation
	$AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Remove 

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
