func level_up():
	level += 1
	max_health *= 1.1
	scale += Vector2(0.2,0.2)

func reset_robot():
	scale    = Vector2(1.0,1.0)
	position = Vector2(0,0)
