extends Node
var number:int;
var my_name:String;
var counter:int;

# Called when the node enters the scene tree for the first time.
func _ready():
	#number = 12;
	#my_name = "Boop";
	#print ("Hello " + my_name + " , your number is " + str(number));
	counter = 0;
	var local_variable:int = 3;
	#print("local variable: " + str(local_variable));
	my_first_function();
	my_second_function("Beep");
	var my_age:int = calculate_age(1969);
	print ("Your age is " + str(my_age));
	## Define bike object and output info
	var my_bike:Bike = Bike.new();
	my_bike.display_color();
	my_bike.display_name();
	my_bike.accelerate();
	## Define second bike and output it's info
	var my_bike2:Bike = Bike.new("My Second Bike", "Green", 6)
	my_bike2.display_color();
	my_bike2.display_name();
	my_bike2.accelerate();
	
# Called every frame. 'delta' is the elapsed time since the previous frame. 
func _process(delta):
	counter += 1;
	#print("Counter"+str(counter));
	#pass

# Print Hello World
func my_first_function():
	print("Hello World");

# Print Name
func my_second_function(name:String):
	print("Hello, your name is " + str(name));

# Calculate and return age based on input. Input must be an int. 
func calculate_age(YOB:int) ->int:
	var age:int = 2026-YOB;
	return (age);
