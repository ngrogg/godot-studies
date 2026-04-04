# Chapter 4: Transforming Built-In Objects to create an indoor scene

## Overview
Create a maze using shapes and textures. Configure lighting.

## Notes
### Creating and importing the necessary assets
Create a new scene if using the old project.

If creating a new project create a scene, save it with a name like "maze" or whatever is desired.

Create a folder in the "FileSystem" tab to hold the scene assets.

Download the asset pack from the site if not done already. This repo has the resource pack.

Copy or move the images "bricks.jpg", "ceiling.jpg", and "gameMap.png" into the maze folder.

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
