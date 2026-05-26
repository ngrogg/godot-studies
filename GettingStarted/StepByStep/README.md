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
### Available Scripting Languages
### Which language should I use?
#### GDScript
#### .NET/C#
#### C++ via GDExtension
### Summary

## Creating Your First Script
### Project Setup
### Creating a New Script
### Hello, World!
### Turning Around
#### Moving Forward
### Complete script

## Listening to Player Input
### Moving when pressing "up"
### Complete script
### Summary

## Using Signals
### Scene setup
### Connecting a signal in the editor
### Connecting a signal via code
### Complete script
### Custom Signals
### Summary
