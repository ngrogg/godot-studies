# Your First 2D Game
## Prerequisites
Build a 2D game "Dodge the Creeps!"

Start with 2D as it's simpler.

Assets for game at "Assets" folder.

Original link for assets can be found [here](https://github.com/godotengine/godot-docs-project-starters/releases/download/latest-4.x/dodge_the_creeps_2d_assets.zip)

Complete code for game can be found [here](https://github.com/godotengine/godot-demo-projects/tree/master/2d/dodge_the_creeps)

## Setting Up The Project
Create a blank project.

For this review it's "dodge_the_creeps".

Unzip the assets from earlier and add the "art" and "fonts" directories to the project folder.

Go to "Project" -> "Project Settings" -> "Display" -> "Window" and set to a portrait view.

This review uses "480 x 720".

Under "Stretch" set Mode to "canvas_items" and Aspect to "keep".

### Organizing the project
Three scenes will ultimately be created: <br>
* **Player**
* **Mob**
* **HUD**

Combine into "Main" scene.

Larger projects should use folders to hold scenes and scripts.

Smaller projects are mostly okay to keep together.

Project root dir identified by "res://".

## Creating the Player Scene
First scene will define the "Player" object.

One of the benefits of a separate scene is it can be tested on it's own.

In general a scene's root node should reflect the object's desired functionality.

What IS the object?

### Node structure
Choose "Other Node" and add an "Area2D" node to the scene.

GoDot includes a "CharacterBody2D" node that in many cases would be a better fit.

This review uses "Area2D" to cover basic core concepts.

Rename node to "Player", ignore the warnings for now.

In the toolbar select the "Groups the selected node with it's children" option.

Prevents children node from being moved or resized by clicking on them.

Save scene as "player.tscn".

GDScripts classes "nodes" use PascalCase. Variables and functions use snake_case and constants use ALL_CAPS.

### Sprite animation
Click on the Player node and and a child node of type "AnimatedSprite2D".

With new node selected, go to "Inspector" and under "Sprite Frames" open the panel.

Click "default", set to "walk".

Add a second animation "up".

Drag the walk and up images from the art folder to their respective animation frames.

Click on the "AnimatedSprite2D" node and set scale to (0.5,0.5)

This option is in the "Inspector" tab under "Transform".

Finally add a child node of type "CollisionShape2D" to the root node "Player".

Under "Inspector", choose "Shape" and choose "New CapsuleShape2D" as that shape is the best fit.

Resize shape to cover sprite.

At this point the warnings should be gone.

Player node now has a shape and can collide with other objects.

Save scene.

## Coding the Player
Attach a script to the "Player" node, default settings are fine.

Documentation includes several C# Warnings/Notices.

As this review is "GDScript" only those will not be included in this review.

Add the code from the documentation to the script.

Using the "`@export`" keyword on variable allows it to be set in "Inspector".

A default value is set in the script and can be overridden in the Inspector.

Use `_ready():` to set screen size and adjust the game when loading the scene.

Use `_process():` to define what the player does.

Check for input, move, play the appropriate animation.

Under "Project" -> "Project Settings" select the "Input Map" tab.

Add "move_right" as an action and set the movement to the right arrow.

Repeat the process to set "move_left", "move_up", and "move_down" to arrow keys.

Note additional keys can be mapped.

Set velocity to (0,0) by default

Add code to change velocity from documentation. Remember that Y is inverted!

`$` is shorthand for `get_node()`.

Code `$AnimatedSprite2D.play()` is the same as `get_node("AnimatedSprite2D").play()`.

Returns the node at the relative path from the current node or returns `null` if node is not found.

Use `clamp()` to prevent sprite from leaving the screen.

Add additional code at end of process function.

Save and test scene. Should be able to move character with arrow keys.

### Choosing animations
Choose animation based on direction and movement using `flip_h` and `flip_v`.

Add code from documentation at end of process function.

Be sure the animation names match

### Preparing for collisions
Want the player to detect when hit by enemies.

No enemies yet but groundwork will be laid.

Add signal to player script.

Connect signal "body_entered(body: Node2D)".

Adds function.

Add code from documentation.

Each time an enemy hits the lay signal is emitted.

Disable player collision so signal isn't triggered more than once.

Disabling a collision shap can cause an error if the engine is processing the collision.

Using `set_deferred()` tells GoDot to wait until it's safe to do so.

Lastly add a function to start the player in a position.

## Creating the Enemy
### Node setup
### Enemy script

## The Main Game Scene
### Spawning mobs
### Main script
### Testing the scene

## Heads Up Display
### ScoreLabel
### Message
### StartButton
### Connecting HUD to Main
### Removing old creeps

## Finishing Up
### Background
### Sound effectws
### Keyboard shortcut
### Sharing the finished game with others
