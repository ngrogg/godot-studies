extends Node2D
var item_name
var item_price
var item_quantity = 0
var item_index = 0


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	update_quantity_label()


func increase_quantity():
	if (!can_click()): return
	item_quantity += 1
	update_quantity_label()

func decrease_quantity():
	item_quantity-=1
	if (item_quantity < 0): item_quantity = 0
	update_quantity_label()

func update_quantity_label():
	get_node("item_qty").text = str(item_quantity)
	get_tree().get_root().get_node("Spatial/shop/shop_system").update_total(item_index, item_quantity)
	
func can_click()->bool:	
	var  shop_sysem = get_tree().get_root().get_node("Spatial/shop/shop_system")
	return shop_sysem.can_add_items_to_cart(item_index);

#	return true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
