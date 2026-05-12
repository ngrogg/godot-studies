extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func leave_shop():
	var purchased_items = []
	var value_of_gold_coins = Item.new(Item.item_type.GOLD).price
	purchased_items = get_tree().get_root().get_node("Spatial/shop/shop_system").shop_items
	var money_left =  get_tree().get_root().get_node("Spatial/shop/shop_system").money_left;
	get_tree().get_root().get_node("Spatial/Player/inventory_system").set_money(money_left/value_of_gold_coins);
	get_tree().get_root().get_node("Spatial/Player/inventory_system").add_purchased_items(purchased_items);
	get_tree().get_root().get_node("Spatial/Player").shop_is_displayed = false;
	get_tree().get_root().get_node("Spatial/Player").end_talking()
	get_tree().get_root().get_node("Spatial/shop_ui").hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
