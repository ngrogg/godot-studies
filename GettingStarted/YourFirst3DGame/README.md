# Your First 3D Game
Note: This review ONLY covers the GDScript version

## Setting Up the Game Area
Download the starter assets

Import the project

Upgrade the version as needed.

### Setting up the playable area
Use a plain Node as the root node, name it "Main".

Add a child node of type "StaticBody3D" and a child node to it of type "CollisionShape3D".

Name the StaticBody3D "Ground"

Select a shape of type "BoxShape3D" for the CollisionShape3D node.

Select the "BoxShape3D" option to expose it's settings.

Set the Size to (60, 2, 60).

Select the "Ground" node and add a "MeshInstance3D" node as a child node.

Under "Inspector" select the "Mesh" menu and choose "BoxMesh".

Select the Mesh and set it's size to match the BoxShape3D node above (60, 2, 60)

Use the Transform/Position options to move the ground node down to -1.

The documentation covers several manual options, however using "Transform" is the easiest and most consistent.

Select Main and add a child node of type "DirectionalLight3D".

Rotate light and enable shadow under Inspector.

For this review the gizmo was used to move the light up with the Y axis (green) and rotated along the X axis (red).

Note that this can be done using the Inspector for more consistent adjustments.

## Player Scene and Input Actions
Create a new scene

Create a root node "Other Node" of type "CharacterBody3D".

Name the node to "Player".

Create a child node of type "Node3D" and name it "Pivot".

From FileSystem drop the "player.glb" file onto "Pivot".

Creates a child node with the player model.

Name the child node "Character".

.glb files are Blender files

Add a child node of type "CollisionShape3D" to the root "Player" node.

Under "Inspector" use the Shape "SphereShape3D".

Resize to fit the main body of the model by clicking and dragging the orange dot.

Documentation states their sphere was about .8 meters.

This review uses around that value.

When resizing the sphere the radius will be in the lower left of the viewport.

Save scene as "player.tscn".

### Creating input actions
Open "Project" > "Project Settings" > "Input Map"

Add the following actions: <br>
* `move_left`
* `move_right`
* `move_forward`
* `move_back`
* `jump`

Click the plus key and bind the arrow keys and space to movement and jumping.

Add WASD as well.

Click the plus key and add Joypad Axes directions for left/right/forward/back.

Use the left stick.

Use Button 0/Xbox A for jump

## Moving the Player With Code
Remember GoDot naming conventions.

GDSCript classes (nodes) use PascalCase, variables and functions use snake_case, and constants use ALL_CAPS

Attach a script to the Player node. Set the template to "Object: Empty".

Note that for a 3D scene a Vector3 is used.

2D code uses pixels for distance. 3D uses meters.

Make calculations using `_physics_process()` virtual function.

Designed for physics-related code like move a body.

Updates node using fixed timer intervals.

[Difference between Idle and Physics Processing](https://docs.godotengine.org/en/stable/tutorials/scripting/idle_and_physics_processing.html#doc-idle-and-physics-processing)
Initialize a direction variable.

Check if a player is pressing more than one of the move input variables and update x/z.

Four conditions, 8 possibilities and 8 possible directions.

Use the `normalized()` method to keep vector length consistent.

As single key and multi-key presses will have different lengths.

Can only normalize if player is pressing a key.

Compute the direction for Pivot by using a Basis that looks in the `direction` variable's direction.

Calculate ground velocity and fall speed separately.

Function `CharacterBody3D.is_on_floor()` returns true if the body is on the floor.

Only apply gravity while player is in the air.

Physics engine can only detect interactions with walls, the floor and other bodies during a frame if collision happens.

Use `CharacterBody3D.move_and_slide()` to ensure a character moves smoothly.

Uses velocity value native to `CharacterBody3D`.

### Testing our player's movement
Put player in the Main scene to test it.

Instantiate Child Scene from Player scene in Main scene.

Add a camera next.

Add a child node of type "Marker3D" to the root node. Name it "CameraPivot".

Add a child node of type "Camera3D" to the node "CameraPivot".

Enable "Preview".

Use "View" > "2 Viewports" to split the view.

Under "Inspector" use the "Transform" option to set the camera Z axis position to 19.

Set "Projection" to "Orthogonal" and "Size" to "19".

As of this writing those options are under "Camera3d" in the "Inspector" tab.

Select the "CameraPivot" node.

Under "Inspector" use the "Transform" option to set the camera X rotation to -45.

Test the scene, adjust the camera's "Far" property as needed to adjust shadow quality.

## Designing the Mob Scene
Create a new scene, using a "CharacterBody3D" node as the root node.

Name it "Mob".

Add a child node "Node3D", name it "Pivot"

Drag and drop the "mob.glb" file onto the node to add the 3d Model to the scene.

Name the new child node "Character"

Add a child node of type "CollisionShape3D" to the root "Mob" node.

Under "Inspector" add a shape "BoxShape3D".

Box can be taller than the monster but should be smaller than the monster overall.

For this review a scale of (.6, .6, .6) was used after an overall rectangle shape was set.

### Removing monsters off-screen
Add a child node of type "VisibleOnScreenNotifier3d" to the root "Mob" node.

Resize the pink box until it covers the entire 3D Model.

Attach a script to the mob node.

Define speed variables. Will be used to define velocity at a later time.

Move the mob every frame. Don't update the velocity every frame.

Want moster to move at a constant speed and leave the screen.

Define a function to calculate the velocity.

Turns monster towards player and randomize both angle and velocity.

Takes a start position, mob spawn position and the player position as arguments.

Spawn mob, turn it towards the player and randomize the angle between `-PI/4` and `PI/4` radians.

Next calculate a random speed

Connect the "VisibileOnScreenNotifier3D" node's "screen_exited" signal to the "Mob" node.

Add `queue_free` to the resulting function.

## Spawning Monsters
Open the Main scene.

Go to "Project" > "Project Settings" > "General" > "Display" > "Window".

Set the Viewport Width and Height to 720x540.

### Creating the spawn path
Add a child node of type "Node3D" to the root node "Main".

Name it "Cylinders".

Add a child node to that node of type "MeshInstance3D".

Under "Inspector" add a Mesh of type "CylinderMesh" to "MeshInstance3D".

Move the node until it's right outside the camera view in the top left corner.

Duplicate the node and repeat the process for the other three corners.

Select all the child nodes, under "Inspector" add a "Material" "StandardMaterial3D".

Expand "Albedo" and choose a color. This review used a reddish color.

Note that color should be set BEFORE the cylinders are duplicated as duplicates will inherit those configurations.

Add a child node "Path3D" to root "Main" node.

Click the "Add Point" tool at the top of the viewport. Add points to the four cylinders.

Click "Close Curve" to close the path once the four points are added.

To sample positions along the curve use a "PathFollow3D" node as a child of the "Path3D" node.

Rename nodes to SpawnPath and SpawnLocation.

### Spawning monsters randomly
Attach a script to the Main node.

Add the code from the documentation.

Drag the "mob.tscn" scene from the FileSystem to the "Mob Scene" slot under "Inspector".

Add a child node of type "Timer" to the root node "Main".

Name it "MobTimer".

Set it's Autostart to "0.5" and it's "Autostart" to "On".

Connect the "timeout()" signal to "Main".

Add code from documentation.

`randf()` produces a value between 0 and 1 for the PathFollow node.

0 is the start of the path, 1 is the end of the path.

Test scene. Should see monsters spawn and move across the screen.

## Jumping and Squashing Monsters
Physics Layers

### Controlling physics interactions
Physics bodies have two complementary properties: layers and masks

Layers define on which physic layer(s) an object is.

Masks control the layers that a body will listen to and detext.

Affect collision detection.

In order for two bodies to interact they need a mask corresponding to the other.

By default all bodies and areas are set to layer and mask 1.

Give layers names.

Project > Project Settings > Layer Names > 3D Physics

Name the first three layers "player", "enemies", and "world".

Under "Main" select the "Ground" node.

Under "Inspector" find the "CollisionObject3D" menu and select "Collision".

Set the Layer to "3" and only 3 and turn off the "Mask".

Repeat the process for the "Player" and "Mob" scenes.

Set the "Player" to use Layer 1 only and Masks 2 and 3.

Set the "Mob" to use Layer 2 only and no masks.

This will allow mobs to move through each other.

Mobs do not need to mask the "world" layer becaus they onyl move on the X and Z plane.

### Jumping
Open "Player.gd".

At the top of the script add the export variable

In the `_physics_process` code add the code from the documentation.

The is_on_floor() method is from the "CharacterBody3D" class. It returns true if the body collided with the floor in the frame.

It's why the gravity is applied to the character.

Note that unlike 2D, Y is positive upwards!

### Squashing monsters
Use Godot group tagging so player interactions with the floor are different than player interactions with monsters.

Open the mob scene and select the Mob node.

Go to "Groups" and add a group "mob"

Make sure that little symbol with the square and circle is next to the mob node to double check work.

Open the player.gd script and add the code from the documentation.

The functions `get_slide_collision_count()` and `get_slide_collision()` both come from "CharacterBody3D" and are related to `move_and_slide()`.

`get_slide_collision()` returns a "KinematicCollision3D" object that holds information about where and how the collision occurred.

Use the get_collider property to check if player collided with a mob

Method `is_in_group()` is available on every Node.

To check that collisions are occuring a vector dot product is used.

When dot products result in greater than 0, the two vectors are at an angle of fewer than 90 degrees.

A value higher than 0.1 indicated roughly above the mob.

Terminate loop to prevent duplicate calls and bugs.

Open the mob.gd script and add code from documentation.

Define a signal for when the mob is squished.

Define a function to destroy the mob when squished.

## Killing the Player
Use an Area3D node for hitbox.

### Hitbox with the area node
Open the Player scene.

Add a child node of type "Area3D" to the root Player node. Name it "MobDetector".

Add a child node of type "CollisionShape3D" to that node.

Under "Inspector" assign a "CylinderShape3D" Shape.

Move the sphere to the top of the player model and make it wider than the round part of the body.

The height of the model will likely need adjusted. The Cylinder being roughly pizza shape and slightly below the eye was used in this review.

Select the "MobDetector" node and under "Inspector" turn off the "Monitorable" property.

This makes it so other physics nodes cannot detect the area.

Then remove the collision layer and set the mask to the "enemies" layer

Under "Signals" choose the "body_entered" signal

Add the code from the Documentation.

This will create a signal, allow the player to die and trigger the death function when the mob detector is triggered.

### Ending the game
Use the player's "hit" signal to end the game.

Connect the signal to stop the MobTimer.

Open "Main", select the Player Node and in the "Signals" doc connect the "hit" signal to the "Main" node.

Expand the created function with code from documentation.

### Code checkpoint
In the documentation this lists all the script to A/B and adjust as needed before proceeding.

## Score and Replay
### Creating a UI theme
### Keeping track of the score
### Retrying the game
### Adding music

## Character Animation
### Using the animation editor
### The float animation
### Animating the mobs

## Going Further
### Exploring the manual
