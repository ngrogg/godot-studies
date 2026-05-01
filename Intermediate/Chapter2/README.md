# Chapter 2: Creating and Managing Weapons

## Notes
### Setting-up the environment
Open the Startup Project from the previous chapter.

Duplicate the "level1.tscn" scene. Rename to "training_camp" and open scene.

Remove the following nodes: <br>
* The launchers (i.e. launcher1, launcher2)
* The spheres (i.e. sphere1, sphere2)
* The ball node
* The start and end nodes

Should only be the spatial, player, ground and message nodes.

Test scene, it should still be possible to walk around.

Create a new folder in the FileSystem, name "training_camp".

Create a child node of type "StaticBody" on the Spatial node, rename it "target1".

Add a childnode to "target1" of type "CollisionShape", set collision shape to a box shape.

Add a child node of type "CSGBox" to the "CollisionShape" node.

Select node "target1" and set position and scale as listed in book.

Change "CSGBox" color to red.

Duplicate and rename targets (target2, target3 etc.)

Space apart from each other.

### Detecing objects ahead using raycasting
Open "Player.gd" script, add code from book.

Add fire command to controls.

Project > Project Settings > Input Map

Add new action called "fire" and bind.

Book uses "F", tried mouse button but it's not recognized...

Test scene, when facing target a message should be printed to console.

### Creating a weapon
### Building a weapon management system with classes
### Managing the collection of ammunition
### Creating a grenade launcher
### Quiz with answers
