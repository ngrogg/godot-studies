func draw_square():
	move_forward(200)
	turn_right(90)
	move_forward(200)
	turn_right(90)
	move_forward(200)
	turn_right(90)
	move_forward(200)

func draw_three_squares():
	draw_square()
	jump(300,300)
	draw_square()
	jump(300,300)
	draw_square()
