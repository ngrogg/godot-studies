extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (PackedScene) var baton
export (PackedScene) var sword
export (PackedScene) var apple
export (PackedScene) var meat
export (PackedScene) var gold
export (PackedScene) var red_diamond
export (PackedScene) var yellow_diamond
export (PackedScene) var blue_diamond;
export(int, "APPLE", "MEAT","GOLD","RED_DIAMOND", "BLUE_DIAMOND", "YELLOW_DIAMOND","SWORD","BATON") var type
var item;
onready var game_manager = get_tree().get_root().get_node("Spatial/game_manager")
# Called when the node enters the scene tree for the first time.
func _ready():
	item = Item.new(type)  
	var new_object_to_collect
	new_object_to_collect = baton.instance()
	match type:
		Item.item_type.BATON:
			new_object_to_collect = apple.instance()
		Item.item_type.SWORD:
			new_object_to_collect = sword.instance()
		Item.item_type.APPLE:
			new_object_to_collect = apple.instance()
		Item.item_type.MEAT:
			new_object_to_collect = meat.instance()
		Item.item_type.GOLD:
			new_object_to_collect = gold.instance()
		Item.item_type.RED_DIAMOND:
			new_object_to_collect = red_diamond.instance()
		Item.item_type.YELLOW_DIAMOND:
			new_object_to_collect = yellow_diamond.instance()
		Item.item_type.BLUE_DIAMOND:
			new_object_to_collect = blue_diamond.instance()
		_:
			pass
	add_child(new_object_to_collect)
	new_object_to_collect.global_transform.origin = global_transform.origin

func body_entered(body):
	#pick_up_object1()
	get_node("../Player").item_to_pickup_nearby = true
	if (is_in_group("level"+str(game_manager.current_stage)) or is_in_group("level0")):
		pick_up_object2()
	


func pick_up_object1():
	get_node("../Player").item_to_pickup_nearby = true
	var can_pick_up = get_node("../Player/inventory_system").update_inventory(type,1)
	if (can_pick_up):
#		get_node("../Player").item_to_pickup_nearby = false
#		queue_free()
		get_node("../Player").item_to_pickup_nearby = false
		get_node("../user_message").hide()
		get_node("../user_message").text = ""
		game_manager.notify(game_manager.possible_actions.acquire_a, str(item.name));
		queue_free()
	else:
			var message = "Sorry, you can't pick up this item"
			get_node("../user_message").text = message

func pick_up_object2():
	var article;
	if (is_a_vowel(item.name [0])): article ="an"
	else: article = "a"
	var message = "You Just Found " + article + " "+item.name +"\n\n Collect y/n"
	get_node("../user_message").show()
	get_node("../user_message").text = message	

func is_a_vowel(the_letter)	:	
	the_letter = the_letter.to_lower()
	var is_a_vowel = false
	for i in "aeiou":
		if (the_letter == i): 
			is_a_vowel = true
	return (is_a_vowel)
	
func _process(delta):
	if (get_node("../Player").item_to_pickup_nearby):
		if (Input.is_key_pressed(KEY_Y)):
			pick_up_object1()
		elif (Input.is_key_pressed(KEY_N)):
			get_node("../user_message").hide()

func body_exited(body):
	get_node("../Player").item_to_pickup_nearby = false
	if (get_node("../user_message").is_visible()):
		get_node("../user_message").text = ""
		get_node("../user_message").hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
