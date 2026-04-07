# Chapter 4: Transforming Built-In Objects to create an indoor scene

## Overview
Create a maze using shapes and textures. Configure lighting for atmosphere.

## Notes
### Creating and importing the necessary assets
Create a new scene if using the old project.

If creating a new project create a scene, save it with a name like "maze" or whatever is desired.

Create a folder in the "FileSystem" tab to hold the scene assets.

Download the asset pack from the site if not done already. This repo has the resource pack.

Copy or move the images "bricks.jpg", "ceiling.jpg", "tile.jpg" and "gameMap.png" into the maze folder.

### Using objects that we can collide with
Previous chapter created a staircase from boxes, but they had no collision.

Maze will use nodes "CollisionShape" and "StaticBody" to add that.

CollisionShape nodes define a shape that determine whether a node is in collision.
Shapes include capsules, boxes or spheres.

StaticBody nodes are subject to phusics including collision. However are static. Useful for walls and such as they don't move.

### Defining the Outline of the Maze
Add child node "StaticBody" to "Spatial" node

Add child node "CollisionShape" to "StaticBody" node.

Select the "CollisionShape" object, under inspector and CollisionShape select "New BoxShape".
Finally add a child node "CSGBox" to "CollisionShape" node

StaticBody node can be collided with.
CollisionShape node will set boundary for collision detection.
CSGBox node will give box a physical appearance.

Remember, any transformations to StaticBody will affect the child nodes!

### Creating the Maze
Rename "StaticBody" to ground

Use Inspector and set Translation position to 0,0,0 under Transform if not set already

Use Inspector and scale to 100,1,100

Select CSGBox in Scene, under CSGBox section in Inspector tab, set material to New Spatial Material.

Select Albedo attribute then drag and drop the "gameMap.png" file from the "FileSystem" tab and maze folder onto the empty menu option.

Double check that "UV1" menu is set to 1,1,1

### Adding Walls using simple transformations
Duplicate ground node and call it "room1"

Position just above the ground, book uses 4,1,1.

Change texture on "CSGBox" for room1 node. Added a New SpatialMaterial. Shape and resize box so it matches one of the "dark" areas on the floor map.

Change the Y scale to 2.5 and position to 3.5. To include the ground size.

Apply the "bricks" texture to the GSGBox for room1.
Change the Uv1 scale as preferred. Books uses 3,2,1.

Duplicate the room1 object to cover the rest of the dark areas of the room.

Be SURE to keep Gizmo STRICTLY Y only from above!
Scale, position and hitbox constraints get weird otherwise.

Next duplicate a room to create a wall.
Set scale to 1,1,100 and transform to 0, 3.5,-100

Wound up using a slightly different Y scale of 3.
Also had to add a rotation of 90 to Y.

Duplicate/rotate/rename walls as needed to make the other three walls.

### Adding a First-Person COntroller to navigate the scene
Add a Character Controller

Select "AssetLib" at top middle of screen, search for "First person Controller", select "Simple First Person Controller", select download.

Should download/install.

Item can be found under "FileSystem" tab at res://assets/player/

Drag and drop the "Player.tscn" onto "Spatial" node.

Move node so it's not in or on a wall. Set Y Translation to "1" or whatever puts it above the floor.

Assign keyboard movement

Project > Project Settings > Input Map

Under "Action" add "player_forwards" and choose "Add"

Select "+" next to "player_forwards", select key and enter your move key.

Book uses arrow keys, these notes use WASD

Repeat process for "player_backwards", "player_left" and "player_right".

Finally add "player_jump" with desired key. Book and these notes use Space Bar.

Also added "player_sprint" wht "shift" as debugger threw massive errors without it.

From the scene double check work with "Control + R". Should be able to navigate maze.
In this review that hotkey didn't work. Used F6 or the "Play Scene" option in upper right of screen.

### Changing the texture of the ground
"SceenTree" tab, locate object "Ground", select CSGBox node of "Ground", select Material, Albedo

Replace material with "tile.jpg" texture under res://maze/

Change UV1 scaling to 20,20,20

### Adding a ceiling to the maze
Duplicate object "Ground"

Rename to "Ceiling"

Position to 0,7,0

Replace the texture with the ceiling.jpg texture from res://maze/ under Inspector > Material > Albedo > Texture

### Adding light to the scene
Add node to Spatial node in "Scene Tree".

Search for "WorldEnvironment", add node

Under Inspector, select WordEnvironment, "New Environment"

Select "Environment", "Ambient Light". Select a white color for the "Color" option

Set ambient light to full darkness.

Select node "WorldEnvironment"

Under Inspector select Environment and put color back to black.

Next set ceiling object to be invisible.

Add child node "Omni Light" to Spatial node, set Y translation to 7.5.

Position it near the player. Remember to use Y view from above to keep Y translation consistent!

Under Inspector locate "Omni" section and change range to 20.

Locate the "Light" section and change energy to 5.

Re-enable the ceiling and test scene.

Temporarily disable ceiling again and copy/move light node to points around the maze.

Once lights are placed, re-enable the ceiling and test again.

During this testing in these notes the WorldEnvironment Ambient light was moved from a black to a very dark brown.

## Post-chapter quiz w/ answers
1. The shortcut to move an object is "Q". **False**
2. THe shortcut to rotate an object is "R". **False**
3. The "Ambient Lighting" can be modified using the menu "Project Settings". **True**
4. "Energy" is an attribute of "OmniLights". **True**
5. If no lights have been added to the scene the scene will be completely dark. **False**, ambient light can be used instead.
6. New objects are always created at the position 0,0,0. **True**
7. "UV1" is one of the attributes of texture materials used in a scene. **True**
8. Once a texture has been applied to an object it cannot be replaced later. **False**
9. A scalling proper of 1,1,1 means that the picture will be repeated once all the x, y and z axes. **True**
10. The shortcut "Control + D" is used to delete an object. **False**
