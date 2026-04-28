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

### Finishing our first game

### Detecting when the player has reached the end of the game

### Level Roundup
