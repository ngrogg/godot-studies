func draw_corner(length):
	move_forward(length)
	turn_right(90)
	move_forward(length)

func draw_corner(length, angle):
	move_forward(length)
	turn_right(angle)
	move_forward(length)

func draw_square(length):
	move_forward(length)
	turn_right(90)
	move_forward(length)
	turn_right(90)
	move_forward(length)
	turn_right(90)
	move_forward(length)
	turn_right(90)

func draw_rectangle(length, height):
	move_forward(length)
	turn_right(90)
	move_forward(height)
	turn_right(90)
	move_forward(length)
	turn_right(90)
	move_forward(height)
	turn_right(90)
