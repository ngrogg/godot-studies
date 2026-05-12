# Name of class
class_name Bike

# Class variables
var speed:float
var color:String
var name:String

# Init function w/ default values
func _init(new_name:="A New Bike", new_color:="Blue", new_speed:=0):
	color = new_color
	speed = new_speed
	name = new_name

# Member functions to return class values
func display_name():
	print("Name: "+ name)
	

func display_color():
	print("Color is: " + color)
	
func accelerate():
	speed+=1
	print("New speed: " + str(speed))
