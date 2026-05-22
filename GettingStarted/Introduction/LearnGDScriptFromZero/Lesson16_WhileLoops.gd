func move_to_bottom():
	while (cell.y < (board_size.y - 1)):
		# Remember Y is inverted!
		cell += Vector2(0,1)
