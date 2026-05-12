class_name WeaponInventory

# Class variables
var Weapon           = load("res://Weapon.gd")
var weapons          = []
var weapon_index:int = 0

# Constructor
func _init():
	var weapon1 = Weapon.new(Weapon.TYPE_GUN)
	var weapon2 = Weapon.new(Weapon.TYPE_AUTO_GUN)
	var weapon3 = Weapon.new(Weapon.TYPE_GRENADE)
	weapons=[weapon1,weapon2,weapon3]

# Function to change weapons, if count goes out of bounds reset to 0
func change_weapon():
	weapon_index += 1
	if weapon_index > 2: 
		weapon_index = 0

# Function to check for ammo
func has_ammo_for_current():
	return(weapons[weapon_index].ammos>0)

# Function to decrease ammo for current weapon
func decrease_curr_ammo(amount:int=1):
	weapons[weapon_index].decrease_ammo(amount)

# Function to get reload time for current weapon
func get_curr_reload_time():
	return weapons[weapon_index].reload_time

# Function to get name of current weapon
func get_curr_weapon_name():
	return weapons[weapon_index].name

# Function to get ammo count for current weapon
func get_curr_weapon_ammos():
	return weapons[weapon_index].ammos
