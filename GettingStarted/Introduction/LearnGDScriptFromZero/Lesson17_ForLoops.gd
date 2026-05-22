func move_to_bottom():
	for number in range(board_size.y - 1):
		cell.y += 1

func run():
	for number in range(3):
		jump(200, 0)
		draw_rectangle(100, 100)
