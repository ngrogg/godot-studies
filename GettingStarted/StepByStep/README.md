# Step By Step

## Nodes and Scenes
Code for this is in the "step-by-step" folder.

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
### In practice
### Editing scenes and instances
### Scene instances as a design language
### Summary

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
