# Chapter 3: Adding Interaction with GDScript

## Overview

## Notes
### Resources necessary for this chapter
Download resource pack for chapter if not already done.

Copy of resources in Beginner/resources/

### Creating a simple script to collect objects
Import "godot-beginner-startup-project" from resource pack.

Find the .godot file.

Add a scene and choose "3D scene" node if not already done.

Add a "Static Body" child node and a CollisionShape to that node.

Save scene if not done already. Book uses name "scene1".

Don't overwrite the existing scenes.

Select CollisionShape node, under "Inspector" choose "Shape" and "New BoxShape" to give collision a shape.

Add child node to Collision Shape of type CSGBox.

StaticBody ensures item can be collided with.
CollisionShape sets boundary for collision and CSGBox gives item a visual appearance.

Rename node "StaticBody" to "Ground".

Under Inspector > Transform set Translation to 0,0,0

Under Inspector > Transform set Scale to 100,1,100.

Select "CSGBox" node, add a new spatial material.

Click the sphere, Albedo and color the ground. Went with grey for this review.

Duplicate the "Ground" object, name it "box_to_collect", set the Scale to 1,1,1 and it's Translation to 0,2,0.

Also change it's color, add a new spatial material. Don't just change the color of the duplicate box.

That will change BOTH colors.

Book uses a red color.

Add the "player.tscn" scene from the FileSystem tab to the Spatial node as a child object.

Rename object to player, set it's Translation to -3, 1, 2.

Set input keys under Project > Project Settings > Input Map.

Action, "move_forward", Add, "+", "Key", enter a key, confirm it shows and press okay.

Repeat for "move_back", "move_left", "move_right", and "jump"

Book uses arrow keys, this review uses WASD.

Preview scene, should be able to move, jump and collide with box.

Create a group or tag for box.

Select 'box_to_collect" object, Node tab next to Inspector

Groups, Add

Book uses name "pick_me".

Repeat steps on "Ground" object and name group "Ground"

Click on the "script" icon next to the "player" object.

Add the following to the end of the "`_physics_process`" function: <br>
`for index in get_slide_count():`<br>
`    print("Collision")`<br>

Test the scene, should output "Collision" in the Output box a bunch.

If that works, change to code as outlined in book.

Test by moving and colliding with box.

Add code to remove node on collision.

Change the `get_slide_count()` function again to match code in book.

Return to 3D scene.

Duplicate the "box_to_collect" object and move around scene.

Easiest is probably to set different Translations.

Test the scene, boxes should disappear when collided with.

### Adding a scoring system
### Loading a new level based on the score
### Level roundup
