class_name PlayerInfo
var akai;
var  dreyar;
var name;
var inventory;
var health = 0
var power = 0
var accuracy = 0
var communication = 0
var xp = 0;
enum player_type { Akai = 0, Dreyar = 1 }


func _init(var the_new_type):
	if (the_new_type == player_type.Akai):
		health = 100;
		power = 40;
		accuracy = 40;
		communication = 40;
		xp = 0;
