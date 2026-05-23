# Introduction

## Introduction to GoDot
### What is Godot?
A 2D/3D game engine, open sourced in 2014.

### What can the engine do?
Make 2D or 3D games, showcase linked [here](https://godotengine.org/showcase/)

### How does it work and look?
Game engine with editor, animation, timemap, shader, debugger, and profiler.

Also supports external programs and plugins for tool like VSCode, Blender or Emacs. There are also Vim plugins for Godot and gdscript plugins for vim :)

### Programming languages
Primary language is GDScript. Also supports C#. Additional language support such as C++ can be added with GDExtensions.

Link to GDExtensions documentation [here](https://docs.godotengine.org/en/stable/tutorials/scripting/gdextension/what_is_gdextension.html#doc-what-is-gdextension)

### What do I need to know to use GoDot?
Familiarity with Object-Oriented Programming concepts. This includes concepts such as objects and classes.

## Learn to code with GDScript
Notes from "Learn GDScript from ZERO".

Link to Docs can be found [here](https://docs.godotengine.org/en/stable/getting_started/introduction/learn_to_code_with_gdscript.html)

Be sure to have graphics acceleration on.

On Linux Brave error will look like " Errors happened while loading: WebGL not available".

Enable under "brave://settings/system" and restart browser.

### Lesson 1: What Code is Like
Very basics of what will be covered in following lessons.

Includes the obligatory "Hello World" in "Try Your First Code". See "Lesson1_TryYourFirstCode.gd"

### Lesson 2: Your First Error
What is an error message? A message stating code doesn't work.

Example error: <br>
`The function "move" already exists in this class (at line 22).`

Are error messages a good or bad thing in code? Good

Includes an example of code that won't run. See "Lesson2_FixYourFirstError.gd".

### Lesson 3: We Stand on the Shoulders of Giants
High level explanation of libraries, functions and using existing code by other developers.

High level basic syntax to call a function, `function()` i.e `show()`.

High level basic syntax to provide function arguments, `function(argument)` i.e `rotate(0.3)`.

What does the code `show()` do? Call the function "show" to make a sprite visible.

How is a function called? Call it's name with opening and closing parenthesis. i.e `function()`.

Includes code to make an invisible character visible. See "Lesson3_MakeTheCharacterVisible.gd".

Includes code to rotate a sprite. See "Lesson3_MakeTheRobotUpright.gd".

### Lesson 4: Drawing a Rectangle
Call functions to move a turtle a set amount of space and to rotate a set amount of degrees.

End goal is to draw a rectangle.

In the function call `move_forward(30)` which part is the argument? "30".

Includes code to draw a corner, rectangle and larger rectangle.

For brevity all the code is under one GDScript file "Lesson4_Rectangles.gd"

### Lesson 5: Coding Your First Function
Sequence of instructions given a name. Name is an identifier.

Functions can be run repeatedly.

Definition: <br>
`func NAME():` <br>
`    code` <br>

Must be indented.

Advantages of functions: reuse code, name multiple lines of code and to run multiple instructions at once.

Functions can't use spaces in names, use underscores instead.

GDScript convention is snake case "function_name" and not camel case "functionName".

Cannot start a function name with numbers.

Includes code to draw squares. See "Lesson5_DrawSquares.gd"

### Lesson 6: Your First Function Parameter
Arguments for functions are "parameters".

Act like placeholders in the functions code.

Example parameter definition: <br>
`func rotate(radians)`<br>
`    rotation = rotation + radians`<br>

What is a function parameter? A label for the value a function receives.

Like function names, parameters cannot have spaces in name.

Correct syntax for a function definition? `func function_name(parameter_name):`

Functions can have multiple parameters, comma delimited

When defining a function, parameters are optional

What is the syntax for a function with multiple parameters? `func function_name(parameter1, parameter_2, ...):`

Includes code for parameter user. See "Lesson6_MultipleParameters.gd".

### Lesson 7: Introduction to Member Variables
Used to trace values that change over time.

Examples are health, checkpoints or score.

Example variable: <br>
`var health = 100`

Member variables are values attached to a game entity.

Properties like the position, rotation and scale of a character.

What's a variable? A label to keep track of a value that can change.

Many member variables have sub-values.

For example position includes the "x" and "y" sub-variables.

Scale also has it's own "x" and "y" sub-variables.

Accessed with dot operator, i.e. `position.x = 200`

In games the Y-axis is positive going down.

How do you access sub-variables? Write a dot "." between a variable and sub-variable.

Includes code for variable use. See "Lesson7_Variables.gd".

### Lesson 8: Defining Your Own Variables
Define variables with "var" keyword, i.e. `var health`.

Set/output values with Python syntax: <br>
`var health = 100`<br>
`health = 50`<br>
`print(health)`<br>

Includes code for defining variables. See "Lesson8_DefiningVariables.gd".

### Lesson 9: Adding and Subtracting
`-=` and `+=` syntax

`func heal(amount):` <br>
`    health += amount`<br>

What are ways to increase the health variables? `health = health + amount` and `health += amount`.

Includes code for adding and subtracting from variable. See "Lesson9_AddingSubtracting.gd".

### Lesson 10: The Game Loop
`_process` function performs continuous actions

`func _process(delta):`<br>
`    rotate(0.05)`<br>

How many parameters does this function take? `func _process(delta):`, 1

Godot will run code every frame

How often does the `_process()` function run? Multiple times a second

Includes code for process function. See "Lesson10_Process.gd"

### Lesson 11: Time Delta
Almost everything in the game will have a process function.

What parameter does the `_process()` function take? delta

Delta represents a time difference.

Used to make sure game runs at the same speed on all computers

Ignoring delta will make movement speed vary depending on the computer.

Delta is typically a small decimal number.

To apply delta multiple speed values by delta. Such as `rotate(3.0 * delta)`.

Delta matters to ensure code runs uniform between computers.

Otherwise games will run at different speeds on different hardware.

Multiplying time-sensitive values by delta makes them time-dependent rather than frame-dependent.

What does `rotation_speed * delta` mean? Multiplying rotation_speed by delta.

Includes code for using delta in a function. See "Lesson11_Delta.gd"

### Lesson 12: Using Variables to Make Code Easier to Read
Example code: <br>
`func _process(delta):`
`    rotate(4 * delta)`<br>

What does "4" mean? It's how fast the character rotates. 4 Radians per second.

Replace with a variable:
`var angular_speed = 4`<br>
`func _process(delta):`
`    rotate(angular_speed * delta)`<br>

Easier to read, easier to reuse

What line defines the angular speed variable? `var angular_speed = 4`

Variables outside functions are script wide.

Variables in functions are limited to script.

Trying to directly access by name will result in scope errors.

Variables can be defined inside and outside of functions.

Grouping variables by their use also makes code easier to read.

Putting all movement variables together, putting all combat variables together.

Includes code making heavier use of variables. See "Lesson12_ClarifyingVariables.gd".

### Lesson 13: Conditions
Use Conditions to run actions selectively.

IF a condition is met, take action.

Conditions evaluate to either true or false.

Normal comparison operators : `>`, `<`, `==`, `!=`, etc.

"Pass" keyword is used to prevent errors in code when a line can't be empty.

Includes code for comparisions. See "Lesson13_IfStatements.gd".

### Lesson 14: Multiplying
Use `*` to multiply values.

`max_health *= 1.1`

Includes code for multiplication. See "Lesson14_Multiplication.gd".

### Lesson 15: 2D Vectors
Scale (x,y) is a Vector2, or 2d vector.

Quantity with magnitude and direction.

In GDScript, 2d vectors are called `Vector2`

What are two examples of vectors? Position and Scale.

Using Vector2 in code to change position: <br>
`func move():`<br>
`    position += Vector2(20, 20)`<br>

How would the robot move 50 pixels to the left? `position -= Vector2(50,0)`

Includes code for 2D Vectors, see "Lesson15_2dVectors.gd"

### Lesson 16: Introduction to While Loops
Loops help repeat code

While loops take action until a condition is true.

Basic syntax: <br>
`while CONDITION:`<br>
`    run code`<br>

Remember to put an iterator or condition for loop to meet or it will run infinitely.

Ex. <br>
`var number = 0` <br>
`while number < 10:`<br>
`    draw_square()`<br>

Includes code for while loops. See "Lesson16_WhileLoops.gd".

### Lesson 17: Introduction to For Loops
For loops do not run forever

Will run for number of iterations.

Ex. <br>
`for number in range(3):`<br>
`    cell += Vector2(1,1)`<br>

`range()` is a helper function. Calling `range(n)` creates a list of numbers from `0` to `n-1`.

What would `range(6)` output? `[0,1,2,3,4,5]`

While loop code to for loop:<br>
`func move_to_end():`<br>
`    for number in range(board_size.x - 1):`<br>
`        cell.x += 1`<br>

Includes code for for loops, see "Lesson17_ForLoops.gd".

### Lesson 18: Creating Arrays
List of values generated by `range()` is an array.

Syntax of arrays: <br>
`var array = [value1, value2, ...]`

Can be mixed in GDScript: <br>
`var vectors_and_numbers = [Vector2(0,0), Vector2(4,3), 5, -1.0]`

Many pathfinding algorithms use arrays of Vector2 coordinates to represent the map and paths

Includes code for Arrays, see "Lesson18_Arrays.gd".

### Lesson 19: Looping Over Arrays
Use for loops to iterate over arrays.

`var numbers = [0,1,2]`<br>
`for number in numbers:`<br>
`    print(number)`<br>

Use `in` keyword to check if an element is in an array.

Ex. <br>
`if VALUE in ARRAY:`<br>

Use `append()` function to append a new value at the end of an array.

Ex. <br>
`array.append(variable)`<br>

Includes code for looping over arrays, see "Lesson19_ArrayLoops.gd".

### Lesson 20: Strings
Strings are used for storing information.

Strings are typically wrapped in double quotations: <br>
`var my_name = "My Name"`<br>
`print(my_name)`<br>

Strings are an array of characters, a for lop can be used to iterate through string.

Is "1" or "name" a string? Yes

An array of strings can be called with a for loop.

See code for Strings, "Lesson20_Strings.gd"

### Lesson 21: Functions That Return a Value
Functions can also calculate and return values.

One predefined function `round()` returns a decimal rounded.

`lerp()` function short of "linear interpolate" blends between two values.

Useful for smoothing movement.

Use the `return()` keyword to return values from a function.

See code for using return, "Lesson21_Return.gd"

### Lesson 22: Appending and Popping Values from Arrays
GDScript can append and remove values from arrays.

"Queues" and "Stacks".

Add with `append()` function to add to end of an array.

`array.append(variable)`

To remove from the start of an array use the `pop_front()` function.

`array.pop_front()`

To remove from the end of an array use the `pop_back()` function.

`array.pop_back()`

See code for using queues and stacks, "Lesson22_StackQueue.gd".

### Lesson 23: Accessing Values in Arrays
Use for or while loops to iterate over entire arrays

Access specific array items by index: `array[index]`.

GDScript counts from 0.


Access third item in array like `array[2]`

Access from back with negative values, -1 for last item in array.

GDScript arrays come with member function `size()`.

Call on array to confirm size of array: `print(array.size())`

Final item is always `array.size() - 1`

See code for array indexes, "Lesson23_ArrayIndexes.gd"

### Lesson 24: Creating Dictionaries
Dictionaries are data structures for mapping pairs of values.

First value: Key

Second value: Value

Define a dictionary with curly brackets.

`Keys: Values`

Dictionaries can hold any values.

Every key needs to be unique.

Access values by key, `dictionary[key]`

Assigned to variables that way too: `var item = dictionary["key"]`

Values are changed that way as well.

`dictionary["key"] += 1`

See code for Dictionaries, "Lesson24_Dictionaries.gd"

### Lesson 25: Looping Over Dictionaries
Use for loops to iterate over a dictionary.

Use `keys()` keyword, `for item in dictionary.keys():`

Optional, can just `for item in dictionary:`

Can also map vectors to dictionaries.

See code for dictionary loops, "Lesson24_DictionaryLoops.gd".

### Lesson 26: Value Types

### Lesson 27: Specifying Types With Type Hints


## Overview of GoDot's key concepts

## First look at GoDot's Interfact

## Learning new features
