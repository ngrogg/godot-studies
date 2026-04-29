extends CSGBox

export (PackedScene) var ball

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Timer variable for launcher to shoot at player
var shoot_timer:Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	shoot_timer = Timer.new()
	add_child(shoot_timer)
	shoot_timer.wait_time = 2
	shoot_timer.connect("timeout", self, "throw_projectile")
	shoot_timer.start()
	
#func _input(event):
#	if (Input.is_key_pressed(KEY_O)):
#		var new_ball = ball.instance()
#		add_child(new_ball)
#		var timer = Timer.new()
#		new_ball.add_child(timer)
#		timer.connect("timeout", new_ball, "queue_free")
#		timer.set_wait_time(2)
#		timer.start()
#		look_at(get_node("../player").global_transform.origin,Vector3.UP)
#		new_ball.linear_velocity = transform.basis.xform(Vector3.FORWARD)*(20)

# Throw balls at player character
func throw_projectile():
	## Declare ball
	var new_ball = ball.instance()
	## Instantiate ball class
	add_child(new_ball)
	## Create timer for ball
	var timer = Timer.new()
	new_ball.add_child(timer)
	## Enable collision
	new_ball.set_contact_monitor(true)
	new_ball.set_max_contacts_reported(5)
	new_ball.connect("body_entered",self,"ball_collision")
	## Start timer for player
	timer.connect("timeout", new_ball, "queue_free")
	timer.set_wait_time(2)
	timer.start()
	## Look at and shoot at player
	look_at(get_node("../player").global_transform.origin,Vector3.UP)
	new_ball.linear_velocity = transform.basis.xform(Vector3.FORWARD)*(20)

# Function for collision
func ball_collision(body):
	if (body.name == "player"):
		print("hit player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
