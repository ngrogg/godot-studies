# Chapter 1: Introduction to Programming in GDScript

## Notes
### Introduction
Covers the following: <br>
* Classes
* Objects
* Statements
* Comments
* Variables
* Constants
* Operators
* Assignments
* Data types
* Methods
* Decision-making structures
* Loops
* Inheritance
* Events
* Comparisons
* Type conversions
* Reserved Words
* Messages to the console windows
* Declarations
* Calls to methods

### Statements
An order to the system.

Example statement: <br>
`print("Hello World")` <br>

In GDScript the keywords "method" and "function" are used interchangeably.

Space indent, not bracket indent.

I.E. <br>
`if (x>100):` <br>
`     print("some statement");` <br>

As opposed to: <br>
`if (x>100) {`<br>
`    print("some statement");`<br>

Statements can end with a semi-colon like above. Optional. Can be used to add multiple statements on the same line.
Not stated in book, however this should be kept consistent for readability. Either always use semi-colons to end lines or don't. Don't mix them.

Ex. `print ("Hello"); print ("World");` <br>

For readability, recommend against doing that...

### Comments
Use `#` for comments, like Python.

Ex. <br>
`# print("This line won't be read by system");`<br>
`print("This line WILL be read by system");`<br>

GoDot hotkey "control + k" to comment/uncomment lines

### Variables
A variable is a container that holds a value.

Declare a variable, assign it a value and optionally combine with other variables.

Ex. <br>
`# Declare variable`<br>
`var myAge:int;`<br>
`# Assign value to variable`<br>
`myAge = 20;`<br>
`# Add 1 to variable`<br>
`myAge = myAge + 1;`<br>


Type is optional, probably good to use for readability and documentation.
Also probably a good idea to keep it consistent like the semi-colons. Either always define type or don't.

Same with other programming conventions can't use reserved words for variables i.e. `var if`.

Variables can be several data types including int, double, float, string, char, bool, arrays or nodes.

Variables need to be declared before use i.e. `var myName:String;`.

Variables are affected by scope.

### Arrays
Function like normal arrays, store variables in an indexed list. Refer to with array and index.

Syntax: <br>
`var names = [];`<br>
`names [0] = "Paul"`<br>

Also can be declared all at once: <br>
`names = ["Joe","Fred","Mary];` <br>

Same with multidimensional arrays.

`var 2darray = [];`<br>
`2darray[0][1] = 0;`<br>
`2darray[0][2] = 0;`<br>
`print (2darray[0][1]);`<br>

Can also use a loop to iterate through array.

### Constants
Variables that don't change. Need declared at top of script. Considered best case to uppercase.

`const VARIABLE:int = 1;`

### Operators
Arithmetic operators: `+, -, *, /, %`.

Remember `%` is modulo.

If adding an int to a string variable needs cast, similiar to python.

`var item:String = "Trucks";`<br>
`var number:int = 3;`<br>
`var message:String = "I have " + str(number) " " + item;`<br>
`print(message);`<br>

Assignment operators: `=, +=, -=, *=, /=, %=`.

Comparison operators: `==, !=, >, <, >=, <=`.

### Conditional statements
if statements.

if (condition): statement <br>
else: statement

### Match statements
Case statements

`var choice:int = 1;` <br>
`match choice:` <br>
`1: print("option 1");` <br>
`2: print("option 2");` <br>
`3: print("option 3");` <br>
`_: print("default option");` <br>

A "break" statement is not required.

Use the "default" as a fail state for unexpected or out of scope choices.

### Loops
While loops

`var iterator:int = 0;`<br>
`while (iterator<10):`<br>
`    print("x = " + str(iterator)");`<br>
`    x += 1;`<br>

For loops

`for iterator in range(0,10):` <br>
`    print ("x = " + str(iterator));` <br>

### Classes
GDScript has classes, methods, functions. No code in this section.

### Defining a class
Defined with `class_name`, variables `var` and functions `func`.

Public by default, access modifiers are possible.

Sample class: <br>
`class_name MyClass`<br>
`var value1:int;`<br>
`func myFunction():`<br>
`    value1 += 1;`<br>

### Accessing class members and variables
use dot notation. Similar to other OOP languages.

Example class: <br>
`var Bike = load("Bike.gd");`<br>
`var myBike:Bike = Bike.new();`<br>

Rough syntax: <br>
`var variableName: dataType = dataType.new();` <br>

using Example class from book: <br>
`var b:Bike = Bike().new();`<br>
`b.accelerate();`<br>
`b.color = "Blue";`<br>

Create a class bike "b", call the "accelerate()" function on bike "b" and set the color of the bike to "Blue".

### Constructors
Construct class based on parameters w/ init function

Last example created a bike with no values set.

To create a bike with values an init function needs defined.

Ex. <br>
`fun _init (new_color:string):`<br>
` color = new_color;`<br>

Then create class with value: <br>
`var myBike:Bike = Bike.new("Blue");`

init function can also be set up with pre-defined values such as: <br>
`func _init(new_name:="A New Bike", new_color:="Blue", new_speed:=0):`<br>
`    color = new_color;`<br>
`    speed = new_speed;`<br>
`    name = new_name;`<br>

Constructor can be called default values or have values passed: <br>
`var myBike:Bike = Bike.new("Fast Bike", "Red", 10);`<br>
`var myBike2:Bike = Bike.new();`<br>

### Static members of a class
Static functions don't need object instantiated.

Define function: <br>
`static func sayHello():`<br>
`    print("Hello");`<br>

Call function: <br>
`Bike.sayHello();`<br>


### Inheritance
Class can inherit properties from a "parent" base class.
I.e. "Vehicle" class and "car" or "truck" classes based on vehicle class.

Define a "base" class: <br>
`class_name Vehicle`<br>
`var numberOfWheels:int;`<br>
`var speed:float;`<br>
`var numberOfPassengers:int;`<br>
`var color:int;`<br>
`func accelerate():`<br>
`    speed += 1;`<br>

Define an inherited class to build on the Vehicle class: <br>
`extends Vehicle;`<br>
`class_name MotorizedVehicle;`<br>
`var engineSize:float;`<br>
`var petrolType:int;`<br>
`var petrolLevel:float;`<br>
`func fullUpTank():`<br>
`    petrolLevel += 1;`<br>

New class has it's own functions while being able to access the parent "base" class functions as well: <br>
`var car:MotorizedVehicle = MotorizedVehicle.new();`<br>
`car.accelerate();` <br>
`print ("Car speed: " + str(car.speed));` <br>

### Methods and Functions
Methods and Functions are used interchangeable in book.

Functions are useful as they can be used over and over again as opposed to writing the same code repeatedly.

An example function that can be re-used: <br>
`func calculateSum(a,b): `<br>
`    return (a+b);`<br>

### Default parameters and return types for functions
The type of accepted parameters can be defined: <br>
`func calculateSum(a:int,b:int):`<br>
`    return (a+b);`<br>

Default values can also be defined: ,br>
`func calculateSum(a:int=0,b:int=0):`<br>
`    return (a+b);`<br>

To specify a return type add "-> TYPE" to function.

Re-using function above: <br>
`func calculateSum(a:int=0,b:int=0) -> int:`<br>
`    return (a+b);`<br>

Works with other types and "-> void" for no return type.

### Scope of variables
Member variables are defined with class and can be used anywhere in class.

Local variables are limited to the scope of their function.

### Events or Signals
There are events and signals for the event handler to process.

Book uses the following "events": <br>
* **_ready**, when a node is available in the scene.
* **_process**, when the screen is refreshed (i.e. every frame).
* **_pressed**, when the user clicks a button.

### Workflow to create a script
Select "Script" from top of GoDot

Go to File > New Script...

Attach the script to a node.

Check in the Output Window there are no errors.

Play the scene.

New scripts to node will typically add some boilerplate code.

### Coding convention
Best practice conventions used in book: <br>
* Classes use PascalCasing, i.e. MyClass
* Variables use snake_casing, i.e. my_variable
* functions ues snake_casing, i.e. my_function
* Blocks of code needs indentation.
* Code should be one statement per line.

For this chapter review most code is camelCase as this was only covered at the end...

### A few things to remember when you create a script (checklist)
This was a basical checklist for programming.

Not included in notes as most programmers should already know this...

### Quiz
1. Please specify whether this statement is TRUE or FALSE: <br>
   The following statement will print "Hello World" in the Output window: <br>
   `print("Hello World");` <br>
   TRUE
2. Please specify whether this statement is TRUE or FALSE: <br>
   The value of the variable "c" will be "3": <br>
   `var a:int=1;` <br>
   `var b:int=1;` <br>
   `var c:int = a + b;` <br>
   FALSE
3. Please specify whether this statement is TRUE or FALSE: <br>
   The value of the variable "full_name" in the following code snippet will be "JohnPaul": <br>
   `var fName:Sring = "John"; ` <br>
   `var lName: String = "Paul";` <br>
   `val full_name:String = fName + lName;` <br>
   TRUE, Pretty sure "Sring" is a typo and is supposed to be "String". <br>
4. Please specify whether this statement is TRUE or FALSE: <br>
   The following code snippet will print "I will not go sailing": <br>
   `var wind_is_strong:bool` <br>
   `wind_is_strong = true;` <br>
   `if (wind_is_strong): print ("I will not go sailing")` <br>
   TRUE
5. Please specify whether this statement is TRUE or FALSE: <br>
   The following code snippet will print "I will not go sailing": <br>
   `var weather_is_sunny:bool = true;` <br>
   `var wind_is_strong:bool = false;` <br>
   `var i_will_go_sailing:bool` <br>
   `if (weather_is_sunny && !wind_is_strong): print ("I will go sailing")` <br>
   `if (!weather_is_sunny || wind_is_strong): print ("I will not go sailing")` <br>
   FALSE
6. Spot three coding mistakes in the following snippet: <br>
   `var test:int`<br>
   `var test2:int;`<br>
   `test3 = 0; #test3 was not declared`<br>
   `test 3 = test1 + test2: #no space between test and 3`<br>
   There's only two... Arguably the first one should have a ";" to keep it consistent but that's not explicitly an error...

7. Consider the method in the snippet, what is the correct way to call the method? <br>
   a) `display_A_message()`<br>
   b) `displayAmessage()`<br>
   c) `display_a_message()`<br>

   C
8. Please specify whether this statement is TRUE or FALSE: <br>
   The value of the variable counter in the following code snippet will be "3" after the code is executed: <br>
   `var counter:int`<br>
   `counter = 0;`<br>
   `counter = counter + 1;`<br>
   FALSE (should be 1).
9. Please specify whether this statement is TRUE or FALSE: <br>
   The following code will print the message "Hello": <br>
   `func print_message():`<br>
   `    print ("Hello");`<br>
   TRUE
10. Please specify whether this statement is TRUE or FALSE: <br>
    A local variable can be used from any part of a script. <br>
    FALSE
