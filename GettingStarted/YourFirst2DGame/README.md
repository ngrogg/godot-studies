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
Simple behavior, spawn randomly at edge of screen, choose a direction and move in a straight line.

Create a "Mob" scene, so it can be instanced to create multiples of the mob.

### Node setup
Create a new scene.

Add the following nodes: <br>
* **RigidBody2D**, named "Mob"
* **AnimatedSprite2D**, child of "Mob"
* **CollisionShape2D**, child of "Mob"
* **VisibleOnScreenNotifier2D**, child of "Mob"

Remember to select the parent node and "group" so children can't be selected. Just like the player scene.

Select the "Mob" node, under inspector set the "Gravity Scale" to 0. Prevents the mob from falling downwards.

Under "CollisionObject2D", under "Inspector" expand the "Collision" group and uncheck "Layer 1" inside the "Mask" property.

Ensures mobs don't collide with each other.

Set up "AnimatedSprite2D" like the Player animations. Three scenes "fly", "swim", "walk", two images for each in the art folder.

Set "Animation Speed" property to "3" for all three animations.

It's not explicitly labeled but is the "#.# FPS" field under "Animations:". During this review the default was "5.0 FPS".

Set the "Scale" to (0.75, 0.75) for the "AnimatedSprite2D" node.

Add a "CapsuleShape2D" shape for the collision. Will need rotated by 90 in "Transform" under "Inspector". Will need resized to fit.

### Enemy script
Attach a script to the "Mob" node.

Add code from Documentation to randomly pick animations and directions

Also add function to remove sprite once it leaves the screen with `queue_free()`.

Connect the `screen_exited()` signal of the "VisibleOnScreenNotifier2D" node to the "Mob" node and add code from documentation.

## The Main Game Scene
Create a new scene and add a Node named "Main".

Use Node and not Node2D as it will be handling game logic.

Click "Instance" and select player scene.

Add child nodes to main: <br>
* **Timer**, named "MobTimer" to control how often mobs spawn.
* **Timer**, named "ScoreTimer" to increment score every second.
* **Timer**, named "StartTimer" to give a delay before starting.
* **Marker2D**, named "StartPosition" to indicate the player's start position.

Set the "Wait Time" property of each timer in seconds as follows: <br>
1. MobTimer: 0.5
2. ScoreTimer: 1
3. StartTimer: 2

Set the "One Shot" property of "StartTimer" to "On".

Set the "Position" of the node to `(240, 450)`

### Spawning mobs
Main node will be spawning mobs.

Add a child node of type "Path2D" named "MobPath" to the root Main node.

Select "Add Point" and create a *CLOCKWISE* pattern in the corners for the mobs to spawn in.

Make sure "Use Grid Snap" and "Use Smart Snap" are enabled.

Do not use a counter-clockwise patter or the mobs will spawn facing outwards.

Once four points are added click "Close Curve".

Add a child node of type "PathFollow2D" node to child node "MobPath" and name it "MobSpawnLocation".

### Main script
Add a script to Main.

Export the mob scene to choose mob.

Under "Inspector" and "Main.gd" there should be a "Mob Scene" property.

Drag "mob.tscn" from the FileSystem or select the scene under the dropdown.

Select the Player scene under the main node and go to "Signals".

Connect the "hit" signal to a new function "game_over".

Enter "game_over" in the "Receiver Method" box.

Add code from Documentation.

Next connect "timeout()" signal from each Timer node to the main script.

Create new signals for "StartTimer", "ScoreTimer", and "MobTimer".

Name them as such "on_type_timer_timeout()" if not already named.

MobTimer should be "on_mob_timer_timeout()" etc.

Should create three new functions.

Add code from Documentation. Two are simple.

Mob Timer will create a mob instance, pick a starting location and set the mob in motion.

Pick a reandom value between 150 and 250 for movement.

Uses "PI" as GoDot uses radians.

### Testing the scene

Add code from Documentation.

Set "Main" as main scene.

Test scene, replace with "pass" once testing complete.

## Heads Up Display
Create a new scene of type "Other Node" and add a "CanvasLayer" node.

Name it "HUD"

Create the following child nodes with the following names: <br>
* **Label**, named "ScoreLabel".
* **Label**, named "Message".
* **Button**, named "StartButton".
* **Timer**, named "MessageTimer".

Type a number into the "Text" fied for "ScoreLabel" under "Inspector"

Change the font under "Theme Overrides" > "Fonts" > "Load".

Use provided font.

Increase the font size. Repeat the process on the "Message" and "StartButton" nodes.

Control nodes have a position and size but they also have anchors. Anchors define the origin.

### ScoreLabel
Add the text "0".

Set Horizontal and Vertical alignment to "Center" under "Inspector".

Use the Anchor Preset "Center Top".

Logo is the Green circle under "2D" view.

### Message
Add the text "Dodge the Creeps!"

Set Horizontal and Vertical alignment to "Center" under "Inspector".

Set the "Autowrap Mode" to "Word"

Under "Control" > "Layout" > "Transform" set "Size.X" to 400.

Choose the Anchor Preset "Center".

### StartButton
Add the text "Start".

Under "Control" > "Layout" > "Transform" set "Size.X" to 200 and "Size.Y" to 100.

Choose the Anchor Preset "Center Bottom".

Under "Control" > "Layout" > "Transform" set "Position.Y" to 580.

Set the "Message Timer" wait time to 2 and the "One Shot" Property to "On".

Add script to HUD and code from documentation.

An alternatively to using a timer node is to use the SceneTree's create_timer() function.

Useful for adding delays such as a wait before showing a button.

Connect the "pressed()" signal of "StartButton" and the "timeout()" signal of "MessageTimer to the HUD node.

Add code from documentation.

### Connecting HUD to Main
Go back to main scene.

Instance the "HUD" scene as a child node of Main

Choose the HUD child node, go to signals.

Connect the HUD's "start_game" signal to the "new_game()" function of the main node.

This is under "pick", verify that green signal is by the new_game() function.

Add code from documentation

Remove `new_game()` from `_ready()` if not already done. For this review it's simply commented out.

### Removing old creeps
In the "Mob" scene.

Select the root node, click "Groups" and the plus to create new group dialog.

Name group "mobs".

Add line from documentation to code in Main.

## Finishing Up
### Background
### Sound effectws
### Keyboard shortcut
### Sharing the finished game with others
