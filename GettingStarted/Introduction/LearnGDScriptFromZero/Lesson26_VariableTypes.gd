var energy = 80

func run():
	display_energy(str(energy))

var player_input = ""
var item_count = 0

func buy_selected_item():
	player_input = get_player_input()
	item_count = int(player_input)
