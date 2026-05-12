extends KinematicBody

enum {IDLE, PATROL, CHASE_PLAYER, ATTACK}
var current_state = IDLE
onready var player = get_node("/root/Spatial/Player")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var WP1 = get_node("/root/Spatial//WP1")
onready var WP2 = get_node("/root/Spatial/WP2")
onready var WP3 = get_node("/root/Spatial/WP3")
onready var WP4 = get_node("/root/Spatial/WP4")
var WP_index = 0
var current_WP
var patrol_previous_position
var speed = 1

var ray:RayCast
var param_can_see_player = false
var param_can_hear_player = false


var param_is_close_to_player = false

var attack_timer:Timer
var can_inflict_damage = true

var health:int = 30

var hitTimer:float;
var hit_flash:bool;
var alpha:float;

var is_active = false

onready var game_manager = get_tree().get_root().get_node("Spatial/game_manager")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var current_stage = "level"+str(game_manager.current_stage);
	if (!is_in_group(current_stage)): 
		hide()
	
	get_node("NPC/AnimationPlayer").get_animation("idle").loop = true
	get_node("NPC/AnimationPlayer").get_animation("walking").loop = true
	
	get_node("NPC/AnimationPlayer").get_animation("sword-and-shield-slash").loop = false
	current_state = PATROL
	current_WP = WP1
	patrol_previous_position = global_transform.origin

	ray = RayCast.new()
	ray.enabled = true
	add_child(ray)
	ray.global_transform.origin += Vector3.UP
	ray.cast_to = Vector3(0,0,100)
	get_node("NPC/AnimationPlayer").get_animation("sword-and-shield-slash").loop = false
	attack_timer=Timer.new()
	add_child(attack_timer)
	attack_timer.wait_time = 1.7
	attack_timer.connect(("timeout"),self,"enable_attacking")
	
	alpha = 0.0
	var material;
	var the_node = get_node("CSGMesh")
	material = the_node.material #.duplicate()
	material.albedo_color = Color(1,0,0,alpha)
	
	
	




func _process(delta):
	if (!is_visible()): return
	if (global_transform.origin.distance_to(player.global_transform.origin) < 2):
		param_is_close_to_player = true	
	else	:
		param_is_close_to_player = false

	if (global_transform.origin.distance_to(player.global_transform.origin) < 4):
		param_can_hear_player = true
	else:
		param_can_hear_player = false
	if ray.is_colliding():
		var obj = ray.get_collider()
		if (obj.name == "player"):
			param_can_see_player = true
		else: 
			param_can_see_player = false

	match current_state:
		IDLE:
			get_node("NPC/AnimationPlayer").play("idle")

		PATROL:
			match (WP_index):
				0:current_WP = WP1
				1:current_WP = WP2
				2:current_WP = WP3
				3:current_WP = WP4
			get_node("NPC/AnimationPlayer").play("walking")
			var distance_to_WP = (current_WP.global_transform.origin - global_transform.origin)			
			if (distance_to_WP.length() < .5) :
				WP_index += 1
				if (WP_index > 3): WP_index = 0
			var direction = (current_WP.transform.origin - transform.origin).normalized();
			move_and_slide(direction.normalized()*speed, Vector3.UP)
			look_at(global_transform.origin - direction, Vector3.UP)
			if (param_can_see_player or param_can_hear_player): current_state = CHASE_PLAYER
		
		CHASE_PLAYER:
			var direction = (player.transform.origin - transform.origin).normalized() * 3;
			move_and_slide(direction.normalized()*speed, Vector3.UP)
			look_at(global_transform.origin - direction, Vector3.UP)
			get_node("NPC/AnimationPlayer").play("walking")
			if (param_is_close_to_player): 
				current_state = ATTACK
				can_inflict_damage = true
		ATTACK:
			if (!param_is_close_to_player): 
				current_state = CHASE_PLAYER
			look_at(get_node("../Player").global_transform.origin, Vector3.UP)
			rotate(Vector3.UP, 3.18)
			get_node("NPC/AnimationPlayer").play("sword-and-shield-slash")
			if (can_inflict_damage):
				get_node("../Player").got_hit()
				attack_timer.start()
				can_inflict_damage = false
			if (!param_is_close_to_player):
				current_state = CHASE_PLAYER

	if (hit_flash):
		alpha -= delta
	var material;
	var the_node = get_node("CSGMesh")
	material = the_node.material
	material.albedo_color = Color(1,0,0,alpha)
	if (alpha <= 0):
		hit_flash = false
		alpha = 0
				
				
				
func enable_attacking():
	can_inflict_damage = true

func decrease_health(increment:int):
	set_health(health-increment)
	hit_flash = true;
	alpha = 0.5

	pass
func set_health(new_health:int):
		health = new_health
		if (health <=0):
				health = 0;
				destroy_target()
func destroy_target():
	game_manager.notify(game_manager.possible_actions.destroy_one, name);
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
