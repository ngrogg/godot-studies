# Chapter 2: Creating your First Script

## Notes
### Quick overview of the interface
This is a review of the GoDot Engine interface.

There is no code and this information is covered more in depth in the "Foundations" review notes.

### Getting Started
Create a new project, name and save wherever.

Choose 3d Scene as the Root Node

Rename node, book uses "example_for_scripting". Save scene.

Choose the "Script" option at the top/middle of the screen.

File > New Script

Be sure it inherits from "Node".

Choose a script name. As of this review the default is "new_script". Choose "Create".

Add code from book to script. Remember to save.

Go back to "3D" menu, right click node and attach script.

Defaults to new script, select the folder under "Path" and choose created script.

Save scene if not already done and run it.

Should output script to the "Output" tab on the bottom middle of GoDot Engine.

Go back to script and expand/extend new_script.gd as listed by book.

Be sure to save and test scene.

`_process` function is called every frame

### Creating your first function
Functions that don't take parameters: <br>
`func my_first_function():`<br>
`    print("Hello World");`<br>

Call the function by name in code: <br>
`my_first_function();` <br>

Add to script as illustrated. Be sure to test.

Functions that take parameters: <br>
`fun my_second_function(name:String):`<br>
`    print("Hello, your name is " + name);`<br>

Add to script as illustrated. Be sure to test.

Functions that take Parameters and return information: <br>
`func calculate_age(YOB:int)->int:`<br>
`    var age:int = 2026-YOB;`<br>
`    return(age);`<br>

### Creating your own class
Add new script, name "bike.gd".

Completely empty file of existing code.

Add code as illustrated in book.

Do not add ";" to class_name, will be considered part of name!

`class_name Bike;` assumes class is named "Bike;" not "Bike".

Once class is defined, call it in the original script.

If that works, create a second bike object with different values such as: <br>
`var my_bike2:Bike = Bike.new("My Second Bike", "Green", 6)`

Test scene, should work without issue.

### Best practices
Use variable names and comments.

Use Pascal and Snake casing consistently.

Check that all opening bracks have closing brackets.

Indent code that's part of a function.

Use the `_ready` function for something that needs done once at beginning of game.

If something needs done repeatedly the `_process` method is better

### Quiz
1. Each class has a default constructor.
2. A constructor can include several parameters. **TRUE**
3. A member variable can be accessed from anywhere in your class. **TRUE**
4. When a new instance of an object is created, the corresponding constructor is called. **TRUE**
5. A new GDScript file created with Godot will inherit from the Node class by default. **TRUE**
6. The `Script` workspace can be used to open, create, and modify scripts. **TRUE**
7. The keyword `class_name` makes it possible to define the name of a class. **TRUE**
8. In `Snake casing` the first character of each word that makes up the name of a variable is capitalized except for the first word. **FALSE**
9. In `Pascal casing` the first character of each word that makes up the name of a variable is capitalized. **TRUE**
10. Functions are declared using the keyword `func`. **TRUE**
