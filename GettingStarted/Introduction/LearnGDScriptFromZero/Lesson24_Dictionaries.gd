var inventory = {
	"healing heart": 3,
	"gems": 9,
	"sword": 1,
}

func add_item(item_name, amount):
	inventory[item_name] += amount
