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

## Player Scene and Input Actions
### Creating input actions

## Moving the Player With Code
### Testing our player's movement

## Designing the Mob Scene
### Removing monsters off-screen

## Spawning Monsters
### Creating the spawn path
### Spawning monsters randomly

## Jumping and Squashing Monsters
### Controlling physics interactions
### Jumping
### Squashing monsters

## Killing the Player
### Hitbox with the area node
### Ending the game
### Code checkpoint

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
