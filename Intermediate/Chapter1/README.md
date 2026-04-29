# Chapter 1: Adding simple artificial intelligence

## Notes
### Resources necessary for this chapter
Download resource packs from the book.

### Instantiating projectiles
Import project "startup_project" from the resource pack.

There's a "v1" and "v2", for this review "v1" appears to be used initially.

Create a 3D Scene, name scene "level1".

Create a "StaticBody" child node to "Spatial" and name it "ground".

Add a "CollisionShape" child node to "ground" node.

Add a "CSGBox" child node to "CollisionShape" node.

Select "CollisionShape" node, under "Inspector" > "CollisionShape" > "Shape" choose "New BoxShape".

Select "CSGBox" node, under "Inspector" > "CSGBox" > "Material" choose "New SpatialMaterial".

Choose sphere, and under Albedo add "texture05.png" to texture.

Under "UV1" change "Scale" to 10, 10, 10

Select "ground" and under "Inspector" > "Transform" and set "Scale" to 100,1,100

Add "Instance Child Scene" to root node "Spatial", select "player.tscn".

Rename node to "player" if not already done.

Under "Project" > "Project Settings" > "Input Map"

Add "move_forward", "move_back", "move_left", and "move_right" controls.

Book uses arrow keys, this review uses WASD.

Add "jump" and bind to space.

Test scene.

Add child node of type "CSGBox" to root node "Spatial" and rename it "launcher".

Position it up and away from the player via Transform.

Create a child node of type "RigidBody" to root node "Spatial" and rename it "ball".

Set position (Translation) to 0,0,0.

Add a CollisionShape node as a child of the "ball" node.

Under "Inspector" set it's scale settings to 0.2,0.2,0.2

Also set "Collision Shape" to "New SphereShape".

Add a child node of type "CSGSphere" to the node "CollisionShape".

Save "ball" node as a scene so it can be reused.

Attach "launcher.gd" script to "launcher" node.

Add code from book.

Return to 3D view, select the "launcher" node.

Under "Inspector" > "Script Variables", drag and drop the ball scene.

Test the scene, launcher should drop a ball when the "O" key is pressed.

Add code from book to launcher script.

Test scene. Created balls should disappear in a few seconds.

Add additional code from book.

Launcher should now look at player, balls should have motion, and scene should throw balls on a timer.

### Managing Collision
Add code from book to "launder.gd".

Test scene, if a ball touches the player a message should display in the Output window.

### Finishing our first game

### Detecting when the player has reached the end of the game

### Level Roundup
