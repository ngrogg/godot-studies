func run():
	var health = 100

	if health > 5:
		print("health is greater than five.")

	if 1 < health:
		print("One is less than health.")

	if health == health:
		print("health is equal to health")

	if health != 7:
		print("health is not equal to seven.")

func heal(amount):
	if ((health + amount) < 80):
		health += amount
	else:
		health = 80

func take_damage(amount):
	if ((health - amount) > 0):
		health -= amount
	else:
		health = 0
