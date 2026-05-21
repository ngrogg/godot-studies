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

### Lesson 14: Multiplying

### Lesson 15: 2D Vectors

### Lesson 16: Introduction to While Loops

### Lesson 17: Introduction to For Loops

### Lesson 18: Creating Arrays

### Lesson 19: Looping Over Arrays

### Lesson 20: Strings

### Lesson 21: Functions That Return a Value

### Lesson 22: Appending and Popping Values from Arrays

### Lesson 23: Accessing Values in Arrays

### Lesson 24: Creating Dictionaries

### Lesson 25: Looping Over Dictionaries

### Lesson 26: Value Types

### Lesson 27: Specifying Types With Type Hints


## Overview of GoDot's key concepts

## First look at GoDot's Interfact

## Learning new features
