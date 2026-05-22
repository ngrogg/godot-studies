var robot_path = [
	Vector2(1, 0),
	Vector2(1, 1),
	Vector2(1, 2),
	Vector2(2, 2),
	Vector2(3, 2),
	Vector2(4, 2),
	Vector2(5, 2)
]

func run():
	for cell in robot_path:
		robot.move_to(cell)

var rectangle_sizes = [
	Vector2(200, 120),
	Vector2(140, 80),
	Vector2(80, 140),
	Vector2(200, 140)
]

func run():
	for size in rectangle_sizes:
		draw_rectangle(size.x,size.y)
		jump(size.x, 0)
