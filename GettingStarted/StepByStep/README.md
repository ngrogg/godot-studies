# Step By Step

## Nodes and Scenes
Code for this is in the `"step_by_step"` folder.

### Nodes
Building blocks of a game.

Dozens of types to display an image, play a sound, represent a camera, etc.

All nodes have the following characteristics: <br>
* A name.
* Editable properties.
* They receive callbacks to update every frame.
* They can be extended with new properties and functions.
* They can be added to another node as a "child".

Nodes together form a tree.

### Scenes
When nodes are organized in a tree that construct is called a "scene".

Scenes work like new node types in the editor and  can be added as a node.

Nodes can create custom and complex node types like a game character

GoDot editor is a scene editor for editing UI, and 2D/3D scenes.

Engine can contain as many scenes as desired but requires a "main scene".

This will be the first scene that loads or a player runs the game.

On top of acting like nodes scenes have their own characteristics: <br>
* They will alwyas have one "root" node
* They can be saved to a local drive and loaded later
* Scenes can be as numerous as desired. There can be plenty of characters from a single character scene.

### Creating your first scene
Open a new project.

Scene dock shows options i.e. "2D Scene" etc.

2D/3D Scene create 2D/3D Nodes.

User Interface adds a "Control" node.

"Control" nodes are the base for UI-related nodes.

"Other Node" allows other nodes to be used as a root node.

For this review a Label is being created, so "Other Node" is chosen.

Select the "Label" node from the search bar

Should create the node and change the view to 2D.

### Changing a node's properties
Select the node

Under "Inspector" change the text to "Hello World".

Move the label to roughly the center of the screen.

Save the scene if not done already, default "label.tscn" is fine.

### Running the scene
Run the scene with F6

Should get a window with the text "Hello World".

Use F8 to quit the scene.

### Setting the main scene
Use F5 to run the project.

Should be prompted to set a main scene.

Use "Select" and choose created label scene.

This can also be set from the menu under "Project" > "Project Settings" along with other project settings.

## Creating Instances
No limit to number of scenes, can be saved with ".tscn" extension.

Stands for Text SCeNe.

### In practice
Download the ball sample project.

Both the original zip and modified code are in the folder.

Import the project, find the "project.godot" file.

Verison warning can be disregarded.

Add "Ball.tscn" as a child node to the root "Main" node.

"Instantiate Child Scene"

Click and drag towards center of the scene.

Run the scene, should be able to watch the ball fall.

Duplicate the ball (control + d) and position around the scene.

Run scene again, balls should fall and interact with each other.

### Editing scenes and instances
Instances can change the properties of one ball without affecting the others using the "Inspector".

Change the default properties of every ball by opent the "ball.tscn" scene and adjusting the ball node there.

Open the "ball.tscn" scene.

Navigate to "Inspector" > "RigidBody2D" > "Physics Material"

Increase the bounce

Balls should bounce a lot more.

Now select one of the instanced balls in the "Main" scene.

Under "Inspector" set it's Gravity Scale to 10.

Re-run the scene, the ball should fall faster.

Note that the "PhysicsMaterial" on the ball cannot be changed.

To change that right click on the material, select properties and click "Make Unique".

### Scene instances as a design language
GoDot is designed to eschew code patterns like Entity-Relationshop and Model-View-Controller.

Idea is to imagine the elements players will see and structure code around them.

Recommend creating a diagram of what items will be in each scene.

### Summary
Instances with scenes allows developers: <br>
* The ability to divide game into reusable components.
* A tool to structure and encapsulate complex systems.
* A language to think about games' structure in a natural way.

## Scripting Languages
Scripts attach to a node and extend it's behavior.

Inherit all functions and properties of the node they attach to.

### Available Scripting Languages
Godot offers four gameplay programming lanaguages: <br>
* GDScript
* C#
* C
* C++

C and C++ require the use of GDExtension

There is community support for other languages but those four are the official/native options

### Which language should I use?
GDScript is recommended for beginners.

C# requires an external code editor like VSCode or Visual Studio

Fewer resources to learn from.

#### GDScript
Object-oriented and imperative

Features: <br>
* Simple syntax
* Fast compilation and loading times
* Well integrated with GoDot with code completion and info from scene
* Built-in vector and transform types, efficient for use of linear algebra
* Support for multiple threads
* No garbage collection, handled by engine. Still offers support if required.
* Gradual type, variables have dynamic types but hints can be used for strong type checks.

Similar to Python syntax

#### .NET/C#
C# offers a tradeoff between performance and ease of use. Be aware of garbage collector.

Must use .Net edition of the Godot editor to script in C#.

GoDot technically can use other .Net library or framework including other Common Language Infrastructure compliant languages.

However only C# is officially supported.

C# is faster than GDScript.

C# GoDot projects cannot be exported to the web platform

#### C++ via GDExtension
GDExtension allows C++ without recompiling GoDot.

Use any version of the language and mix compiler brands/versions due to internal C API Bridge.

GDExtension is the most performant option.

Availble types, functions, and properties closely resemble GoDot's actual C++ API.

### Summary
Scripts are attached to a node to extend it's functionality.

Godot supports four official scripting languages.

Can mix languages.

## Creating Your First Script
### Project Setup
Create a new project.

For this review it's "your_first_script" project.

Use the "Other Node" button and select "Sprint2D".

Drag the "icon.svg" from "FileSystem" to "Texture" under "Sprite2D" in the "Inspector" tab.

### Creating a New Script
Right click the node and attach a script.

Use GDScript if not already select.

Change the Template to "Object: Empty" to start with an empty file.

Review includes C# however this review will use GDScript as this review is done on a Linux machine.

### Hello, World!
As a test print hello world.

`func _init():` <br>
`    print("Hello, world!")`

Save scene if not done already.

Test the scene, should see output in console.

### Turning Around
Member Variables sit near the top of the script, after any "extends" lines but before any functions.

Add the code from the documentation.

Note that GoDot works in Radians by default. Has functions to use Degrees instead if preferred.

Functions in documentation start with a leading underscore.

Built in functions that can be overridden start with an underscore.

Run the scene, should see icon spinning around.

#### Moving Forward
Add code for velocity and position from documentation.

Should make icon move in a circle

### Complete script
Complete `sprite_2d.gd` script sans comments: <br>
`extends Sprite2D` <br>
` ` <br>
`var speed         = 400` <br>
`var angular_speed = PI` <br>
` ` <br>
`func _process(delta):` <br>
`	rotation    += angular_speed * delta` <br>
`	var velocity = Vector2.UP.rotated(rotation) * speed` <br>
`	position    += velocity * delta` <br>

## Listening to Player Input
Builds on the previous project.

Two main input tools

First, built in input callbacks, `_unhandled_input`.

Godot calls every time the player presses a key.

Second, the `Input` singleton. Singletons are globally accessible objects. Correct tool for checking input on every frame.

This review uses the "Input" singleton.

Turning requires a new variable `direction`.

Replace the rotation variable with code from the documenation.

Note that `ui_left` and `ui_right` are predefined in every GoDot project.

Comment out the `velocity` and `position` lines in the script.

Save and test scene. Should be able to rotate icon with left and right.

### Moving when pressing "up"
Replace `velocity` variable with code from documentation.

`Vector2.ZERO` is another constant for a 2d Vector of length 0.

Use pre-defined `ui_up` to set velocity when player presses up.

### Complete script
`extends Sprite2D` <br>
` ` <br>
`var speed = 400` <br>
`var angular_speed = PI` <br>
` ` <br>
` ` <br>
`func _process(delta):` <br>
`	var direction = 0` <br>
`	if Input.is_action_pressed("ui_left"):` <br>
`		direction = -1` <br>
`	if Input.is_action_pressed("ui_right"):` <br>
`		direction = 1` <br>
` ` <br>
`	rotation += angular_speed * direction * delta` <br>
` ` <br>
`	var velocity = Vector2.ZERO` <br>
`	if Input.is_action_pressed("ui_up"):` <br>
`		velocity = Vector2.UP.rotated(rotation) * speed` <br>
` ` <br>
`	position += velocity * delta` <br>

### Summary
Every script in GoDot represents a class and extends one of the engine's built in classes
Node types classes inherit give access to properties such as rotation and position.

Varibles at the top of the script are class properties or member variables.

GoDot provides several virtual functions.

Functions include `_process()` to apply changes to the node every frame,
and `_unhandled_input()` to handle key and button presses from the users

The `Input` singleton allows script to react to the player's input anywhere in the code.

Typically used in the `_process()` loop.

## Using Signals
### Scene setup
### Connecting a signal in the editor
### Connecting a signal via code
### Complete script
### Custom Signals
### Summary
