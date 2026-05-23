var inventory = {
	"healing heart": 3,
	"gems": 5,
	"sword": 1,
}

func run():
	for item_name in inventory:
		var item_count = inventory[item_name]
		display_item(item_name, item_count)

var units = {
	Vector2(1, 0): "robot",
	Vector2(2, 2): "turtle",
	Vector2(3, 0): "robot",
}

func run():
	for cell in units:
		var unit = units[cell]
		place_unit(cell, unit)
