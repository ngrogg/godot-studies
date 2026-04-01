extends Node

var shop_items:Array;
export (PackedScene) var shop_item_component;
var shop_item_components:Array
var total_purchase = 0;
var initial_money;
var money_left;
var top_left_x;
var y_top_padding = 100;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	initial_money = 100;
	money_left = initial_money;
	top_left_x = 50;
	shop_items.push_back(Item.new(Item.item_type.YELLOW_DIAMOND))
	shop_items.push_back(Item.new(Item.item_type.BLUE_DIAMOND))
	shop_items.push_back(Item.new(Item.item_type.RED_DIAMOND))
	shop_items.push_back(Item.new(Item.item_type.MEAT))
	shop_items.push_back(Item.new(Item.item_type.APPLE))
	#init()

func init():
	shop_item_components.push_back(shop_item_component.instance())
	shop_item_components.push_back(shop_item_component.instance())
	shop_item_components.push_back(shop_item_component.instance())
	shop_item_components.push_back(shop_item_component.instance())
	shop_item_components.push_back(shop_item_component.instance())
	get_node("../../shop_ui/shop_money_left_value").text = str(initial_money)
	for i in range (0, shop_item_components.size()):
		setup_shop_item_component(i);
	#initial_money = 1000	
	initial_money = get_tree().get_root().get_node ("Spatial/Player/inventory_system").get_money()
	money_left = initial_money;

		

func setup_shop_item_component (index:int):
	shop_items[index].nb = 0
	shop_item_components[index].item_index = index
	var width = 150;
	var border_around_each_item = 1.05;
	shop_item_components[index].name = "shop_item_" + str(index) + shop_items[index].name + "($" + str(shop_items[index].price) + ")";
	shop_item_components[index].find_node ("item_label").text = shop_items[index].name + "($" + str(shop_items[index].price) + ")";
	get_node("../../shop_ui").add_child(shop_item_components[index])
	shop_item_components[index].global_transform.origin  = get_node("../../shop_ui").global_transform.origin
	
	var add_on = shop_item_components[index].global_transform.origin		
	var x_pos = top_left_x + (index%3)* width*border_around_each_item
	var y_pos = y_top_padding + (index/3) * width * border_around_each_item		
	shop_item_components[index].global_transform.origin = add_on +  Vector2(x_pos, y_pos);
	shop_item_components[index].find_node("item_image").texture = load (shop_items[index].get_texture_path())
		
func update_total(item_index:int, item_amount:int):
	shop_items[item_index].nb = item_amount;
	var temp_total:int;
	temp_total = calculate_total();
	print("Updating Total: index=" + str(item_index)+ "nb items"+str(shop_items[item_index].nb) + "; price:" + str(shop_items[item_index].price))
	get_node("../../shop_ui/shop_total_value").text = str(temp_total)
	total_purchase = temp_total
	money_left = initial_money - temp_total
	get_node("../../shop_ui/shop_money_left_value").text= "" + str(money_left)

func calculate_total()->int:
	var temp:int = 0;
	for i in range (0,shop_items.size()):
		temp += shop_items[i].nb * shop_items[i].price;
	return temp;


func can_add_items_to_cart(index:int):
	if (money_left >= shop_items[index].price && shop_items[index].nb < shop_items[index].max_nb):
		return true
	else: return false
	
#func _process(delta):
#	if (Input.is_action_just_pressed("fire1")): 
#		init()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
