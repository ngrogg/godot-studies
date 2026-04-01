extends Node

var player_inventory;
var current_inventory_index = 0;
var is_visible = false;
var path = "../../inventory/"
onready var inventory_text = get_node(path + "inventory_text")
onready var inventory_image = get_node(path + "inventory_image")
onready var inventory_description = get_node(path + "inventory_description")
onready var inventory_panel = get_node(path + "inventory_panel")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	display_ui(false);
	player_inventory = []
	var new_item = Item.new(Item.item_type.GOLD)
	player_inventory.push_back(new_item)
	new_item = Item.new(Item.item_type.MEAT)
	player_inventory.push_back(new_item)
	player_inventory[1].nb = 300;
	check_inventory();

func check_inventory():
	for i in range(player_inventory.size()):
		print(player_inventory[i].item_info());

func display_ui(toggle:bool):
	if (toggle):
		inventory_text.show();
		inventory_panel.show();
		inventory_image.show();
		inventory_description.show();
	else:
		inventory_text.hide();
		inventory_panel.hide();
		inventory_image.hide();
		inventory_description.hide();

func _process(delta):
	if is_visible:
		display_ui(true)
		var current_item = player_inventory[current_inventory_index];
		inventory_text.text = current_item.name + "[" + str(current_item.nb) + "]";
		inventory_description.text = current_item.description +"\n\n Press [U] to Select";
		inventory_image.texture = load(current_item.get_texture_path());
		if (Input.is_action_just_pressed("inventory")):
			current_inventory_index +=1
			if (current_inventory_index >= player_inventory.size()):
				current_inventory_index = 0;
				is_visible = false
				display_ui(false)
		if (Input.is_action_just_pressed("use_inventory")):		
			if (player_inventory[current_inventory_index].family_type == Item.item_family_type.FOOD):
				get_node("../../Player").increase_health(player_inventory[current_inventory_index].health_benefits);
				player_inventory.remove(current_inventory_index);
				current_inventory_index = 0;
				is_visible = false
				display_ui(false)
		

	else:
		if (Input.is_action_just_pressed("inventory")): is_visible = true;


func update_inventory(type_of_item:int, nb_items_to_add:int):
	var found_similar_item = false
	for i in range (0, player_inventory.size()):
		if (player_inventory[i].type == type_of_item):
			if (player_inventory[i].nb + nb_items_to_add <= player_inventory[i].max_nb):
				player_inventory[i].nb += nb_items_to_add;
				found_similar_item = true;
				break
			else: return false
	if (!found_similar_item):
		var new_item = Item.new(Item.item_type.GOLD)
		player_inventory.push_back(Item.new(type_of_item))
		player_inventory[player_inventory.size() - 1].nb = nb_items_to_add; 
	return true;

func get_money():
	for i in range (0,player_inventory.size()):
			if (player_inventory[i].type == Item.item_type.GOLD):
					return (player_inventory[i].nb * player_inventory[i].price)
	return 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func add_purchased_items( purchased_items):
	var t:bool;
	for i in range (0, purchased_items.size()):
		if (purchased_items[i].nb > 0):
			t = update_inventory(purchased_items[i].type, purchased_items[i].nb);
func set_money(new_amount:int):
	for i  in range (0, player_inventory.size()):
		if (player_inventory[i].type == Item.item_type.GOLD):
			player_inventory[i].nb = new_amount
