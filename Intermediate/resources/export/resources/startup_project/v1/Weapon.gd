class_name Weapon

# Variables
## Const variables
const TYPE_GUN:int      = 0
const TYPE_AUTO_GUN:int = 1
const TYPE_GRENADE:int  = 2

## Assignable variables
var reload_time:int
var name:String
var ammos:int
var max_ammos:int 

# Constructor function
func _init(weapon_type:int=TYPE_GUN):
	match weapon_type:
		TYPE_GUN:
			name        = "GUN"
			reload_time = 2
			ammos       = 10
			max_ammos   = 20
		TYPE_AUTO_GUN:
			name        = "AUTOMATIC GUN"
			reload_time = 2
			ammos       = 20
			max_ammos   = 20
		TYPE_GRENADE:
			name        = "GRENADE"
			reload_time = 3
			ammos       = 10
			max_ammos   = 5
	print("Created Weapon Type: " + str(weapon_type))

# increase/decrease ammo functions
func increase_ammo(ammo_increase:int = 1):
	if (ammos + ammo_increase <= max_ammos):
		ammos+=ammo_increase

func decrease_ammo(ammo_decrease:int = 1):
	ammos -= ammo_decrease
	if ammos < 0:
		ammos = 0
