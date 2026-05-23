var waiting_orders = []
var completed_orders = []

func complete_current_order():
	var order = waiting_orders.pop_front()
	completed_orders.append(order)

var crates = ["healing heart", "shield", "gems", "sword"]

func run():
	while crates:
		crates.pop_back()
