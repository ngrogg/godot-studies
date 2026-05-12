extends KinematicBody

var score:int = 0 


#next change scene and update score
var moveSpeed:float = 5
var jumpForce:float = 5
var gravity:float=12


#camlook
var minLookAngle:float = -90
var maxlookAngle:float = 90
var sensitivity:float = 10
var velocity:Vector3 = Vector3()
var mouseDelta: Vector2 = Vector2()
#var scoreUI:RichTextLabel


onready var camera :Camera = get_node("Camera")#only when node is initialized
onready var user_message_ui:Label = get_node("../userMessageUI")
onready var timer:Timer = get_node("../Timer")
var nb_petrol_can :int = 0
onready var scoreUI:Label = get_node("../scoreUI")

var petrol_can1:TextureRect
var petrol_can2:TextureRect
var petrol_can3:TextureRect

onready var beep_sound:AudioStreamPlayer = get_node("AudioStreamPlayer")

onready var bg_sound:AudioStreamPlayer = get_node("../bgSound")
var sound_is_on:bool = true

onready var viewport_container:ViewportContainer = get_node("../ViewportContainer")

func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	user_message_ui.set_text("");
	timer.set_wait_time(2)
	scoreUI.set_text("Score: "+str(score))



	



func _physics_process(delta):#called 60 times per sec
	velocity.x = 0
	velocity.z = 0
	var input:Vector2 = Vector2()
	if Input.is_action_pressed("move_forward"):
		input.y+=1
	if Input.is_action_pressed("move_back"):
		input.y-=1	
	if Input.is_action_pressed("move_left"):
		input.x+=1		
	if Input.is_action_pressed("move_right"):
		input.x-=1		
	input.normalized();
	
	var forward = global_transform.basis.z;
	var right = global_transform.basis.x;
	
	var relativeDirection = (forward * input.y + right*input.x);
	velocity.x = relativeDirection.x * moveSpeed
	velocity.z = relativeDirection.z * moveSpeed
	
	velocity.y -=gravity*delta;#every second we remove delta
	velocity=  move_and_slide(velocity, Vector3.UP);
	
	
	if (Input.is_action_pressed("jump")) and is_on_floor():
		velocity.y = jumpForce
		
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		#print("Collision with " + collision.collider.name)
		#if (collision.collider.is_in_group("pick_me")):
		if (collision.collider.is_in_group("pick_me") ||collision.collider.is_in_group("petrol-can") ||collision.collider.is_in_group("plane")):


			print("Collision with " + collision.collider.name)
			if (!collision.collider.is_in_group("plane")):
				collision.collider.queue_free()
	
			user_message_ui.set_text("Box Collected");
			score += 1
			beep_sound.play()

			timer.start()	
			scoreUI.set_text("Score: "+str(score))

			if (collision.collider.is_in_group("petrol-can")):
				nb_petrol_can+=1
				match nb_petrol_can:
					1:petrol_can1.visible = true
					2:petrol_can2.visible = true
					3:petrol_can3.visible = true
				if (nb_petrol_can == 1): 
						user_message_ui.set_text(str(nb_petrol_can) + " Can Collected");
				else:
						user_message_ui.set_text(str(nb_petrol_can) + " Cans Collected");
			elif (collision.collider.is_in_group("plane")):
				print("Collidedwith plane")
				if (nb_petrol_can <3) :
					user_message_ui.set_text("Sorry you need 3 cans to fly the plane");
				else:
					get_tree().change_scene("res://ending_scene.tscn") 

			else:

				if (score == 1):
					user_message_ui.set_text(str(score) + " Box Collected")
				else:
					user_message_ui.set_text(str(score) + " Boxes Collected")
				

			print("Score: "+str(score))
			if (score == 3):
				get_node("../maze").queue_free()	
				var new_scene = load("res://level2.tscn").instance()
				new_scene.set_name("level2")
				get_parent().add_child(new_scene)
				init_ui_level2()
				get_node("../timer").counter = 0;

	
func _process(delta):#not physics related
	camera.rotation_degrees.x -= mouseDelta.y*sensitivity*delta
	
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minLookAngle,maxlookAngle)
	#around y axis
	rotation_degrees.y -= mouseDelta.x*sensitivity*delta
	
	#reset mousedelta
	mouseDelta = Vector2()
func _input(event):
	if event is InputEventMouseMotion	:
		mouseDelta = event.relative
	if Input.is_key_pressed(KEY_P):
		if (sound_is_on): bg_sound.stop()
		else: bg_sound.play()
		sound_is_on = ! sound_is_on
	if Input.is_key_pressed(KEY_M):
			viewport_container.visible = ! viewport_container.visible



func _on_Timer_timeout():
	user_message_ui.set_text("")
	timer.stop()

func init_ui_level2():
	petrol_can1 = get_node("../level2/petrol_can1_ui")
	petrol_can2 = get_node("../level2/petrol_can2_ui")
	petrol_can3 = get_node("../level2/petrol_can3_ui")
	petrol_can1.visible = false
	petrol_can2.visible = false
	petrol_can3.visible = false
