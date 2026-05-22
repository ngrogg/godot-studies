var level = 1
var max_health = 100

func level_up():
	level += 1
	max_health *= 1.1

var level = 3
var health = 100
var max_health = 100

func take_damage(amount):
	if (level >= 3):
		health -= amount * 0.5
	else:
		health -= amount

	if health < 0:
		health = 0
