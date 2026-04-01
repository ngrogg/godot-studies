extends KinematicBody

var shop_is_displayed:bool;
onready var shop_ui = get_tree().get_root().get_node("Spatial/shop_ui")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var item_to_pickup_nearby
var item_to_pickup
onready var user_message = get_node("../user_message")
export(int, 1,100) var health

enum {IDLE, WALK, WALK_REVERSE, RUN, ATTACK_WITH_SWORD}
var rotation_increment = .2
var current_state = IDLE
var speed = 1
onready var pc_node = get_node("PC/AnimationPlayer")

onready var dialogue_panel = get_node("../dialogue_panel")
onready var dialogue_box = get_node("../dialogue_panel/dialogue_box")
onready var dialogue_image = get_node("../dialogue_panel/dialogue_image")
var name_of_current_npc_talking:String = ""
var is_talking = false;


var nb_lives = 3
var initial_position:Vector3;



func display_shop_ui():
	shop_ui.show()

func entering_shop(body):
	if (body.is_in_group("player")):
		shop_is_displayed = true
		display_shop_ui()
		get_tree().get_root().get_node("Spatial/shop/shop_system").init()
		speed = 0


func _ready():
	pc_node.get_animation("idle").loop = true
	pc_node.get_animation("walking").loop = true
	pc_node.get_animation("running").loop = true
	dialogue_panel.hide()
	user_message.hide()
	get_node("../health_bar").set_value(health) 
	shop_ui.hide()
	pc_node.get_animation("sword-and-shield-slash").loop = false
	initial_position = transform.origin
	
func _process(delta):
	match current_state:
		IDLE:
			pc_node.play("idle")
		WALK:
			speed = 1
			pc_node.play("walking")
			var forward = global_transform.basis.z;
			move_and_slide(forward*speed, Vector3.UP)

		WALK_REVERSE:			
			speed = -1
			pc_node.play("walking")
			var forward = global_transform.basis.z;
			move_and_slide(forward*speed, Vector3.UP)			
		RUN:
			speed = 4.0
			pc_node.play("running")
			var forward = global_transform.basis.z;
			move_and_slide(forward*speed, Vector3.UP)
		ATTACK_WITH_SWORD:
			pc_node.play("sword-and-shield-slash")
			yield(pc_node, "animation_finished")
			current_state = IDLE


func _input(event):
	if (is_talking): return;
	if (Input.is_action_pressed("move_fwd")) :current_state = WALK
	elif (Input.is_action_pressed("move_back")) :current_state = WALK_REVERSE
	else: current_state = IDLE
	if (Input.is_action_pressed("turn_left")):
		rotate_y(rotation_increment)
	if (Input.is_action_pressed("turn_right")):
		rotate_y(-rotation_increment)		
	if (Input.is_key_pressed(KEY_ALT)):
		current_state = RUN
	if (Input.is_action_just_released("fire1")): 
		current_state = ATTACK_WITH_SWORD


func _physics_process(delta):
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if (collision.collider != null):
			if (collision.collider.is_in_group("NPC_TALK")):
				if (collision.collider.name == "Diana" && !is_talking):
					dialogue_image.texture = load("res://Diana.jpg");
					collision.collider.start_dialogue()
					current_state = IDLE
					is_talking = true;

func end_talking():
	is_talking = false
	var forward = global_transform.basis.z;
	move_and_slide(-forward*1.5, Vector3.UP)
	rotate_y(3.14)

func increase_health(amount:int):
	health += amount
	if (health >= 100): health = 100
	print("Health="+str(health))
	get_node("../health_bar").set_value(health)

func is_attacking()->bool:
	if (current_state == ATTACK_WITH_SWORD): return true;
	else: return false;	


func got_hit():
	health -= 5
	if (health <= 0):		
		health = 100
		nb_lives -=1
		if (nb_lives == 0): print ("Game Over");
		transform.origin = initial_position
	get_node("../health_bar").set_value(health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
