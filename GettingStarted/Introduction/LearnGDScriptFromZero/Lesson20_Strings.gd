var robot_name = "0"

func run():
	print("Hi, " + robot_name + "!")

	combo = ["jab","jab","uppercut"]
	for move in combo:
		play_animation(move)
