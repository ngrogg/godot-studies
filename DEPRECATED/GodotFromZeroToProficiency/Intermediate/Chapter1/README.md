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
Add a child node of type "StaticBody" to the root node "Spatial".

Rename node to "sphere1"

Add a child node of type "CollisionShape" to node "sphere1", set it's shape to "sphere"

Add a child node of type "CSGSphere" to node "CollisionShape", set it's color to red.

Set "Translation" Y to 1.5 so it's above the ground and visible.

Under "Node" > "Groups" add node to group "collect".

Duplicate and position between player and launcher.

Open "Player.gd" script attached to player node.

Add code from book.

Test scene, should be able to collide with spheres.

Return to 3d view

Create a child node of type "StaticBody" to the root node "Spatial".

Name the node "start".

Add a child node of type "CollisionShape" to the node "start" and set it's shape to a cylinder.

Add a child node of type "CSGCylinder" as a child of the node "CollisionShape" and change it's color to green.

Set "Scale" to 2,0.2,2

Set "Translation" Y to 1.2

Duplicate "start" node, rename to "end", change material and color to "red".

Save launcher "branch" node as a scene.

Add to root node "spatial" as an child scene.

Position the new launchers close to the spheres.

Edit "launcher.gd" with code from book.

Should be able to restart level when hit by ball.

### Detecting when the player has reached the end of the game
Open script "Player.gd" and add code from book.

Add child node of type "Label" to the "player" node.

Rename node to "message"

Under "Inspector" > "Control" > "Rect" set X/Y size

Under "Inspector" > "Label" set Align and V Align

Under "Inspector" > "Control" > "Theme Overrides" > "Fonts" add "New DynamicFont"

Edit and under "Font" add font from "FileSystem"

Per this review the "Label" node had to be moved out from the "player" node to the root "Spatial" node...

### Quiz with answers
1. The event "body_entered" is called whenever a collision occurs between a "RigidBody" node and another node.
   **TRUE**
2. To be able to access a variable from a script through the Inspector, this variable can be declared preceded by the keyword "export"
   **TRUE**
3. Write the missing line in this code to be able to destroy the object we have collided with, assuming that this object is referred to as "body": <br>
   `func ball_collision(body):`<br>
   `    <MISSING CODE>`<br>
   `    body.queue_free()`<br>
4. A node can be saved as a separate scene and re-used in any other scene.
   **TRUE**
5. A collision shape can be used to detect collision with a node.
   **TRUE**
6. Find one error in the following code: <br>
   `_ready () # Should be func _ready():`<br>
   `{`<br>
   `    var score_int = 0;`<br>
   `    get_the_node("../Label").set_text(""); # Should be get_node`<br>
   `}`<br>
7. And object selected in the "Hierarchy" window can be duplicated using the shortcut "CTRL+D"
   **TRUE**
8. If the node attached to the next script is a "Rigidbody", the following code will access this nodes' velocity: <br>
   `linear_velocity = transform.basis.xform(Vector3.FORWARD)*(20)`<br>
   **FALSE**, the second parameter is missing; it could instead be: <br>
   `new_ball.linear_velocity = transform.basis.xform(Vector3.FORWARD)*(20)`<br>
9. The following code will cause the current node to look towards the node called player: <br>
   `look_at_the_node(get_node("../player").global_transform.origin,Vector3.UP)`<br>
   **FALSE**, it should be "look_at_node".
   `look_at_node(get_node("../player").global_transform.origin,Vector3.UP)`<br>
10. The method "is_in_group" can be used to determine if a node is part of a specific group.
    **TRUE**
