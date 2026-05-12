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
Create child node of type "TextureRect" on root node "Spatial", rename node to "crosshair".

Drag the "crosshair.png" from "FileSystem" to the "Texture" attribute under "Inspector".

Move Crosshair to middle of screen, "TEST" font should be about centered.

Test scene, should be able to "fire" at the targets more accurately.

Attach a script to the "crosshair" node, same name should be fine.

Add code from book.

Test scene, crosshair should be perfect and weapon should have ammo.

### Managing Damage
Select "target1" node, attach script, add script "ManageNPC.gd"

Add code from book.

Once scripts modified, attach script to other targets.

On production code, this script should be made before the targets are duplicated so this would only need done once.

Create a group "target" and apply to all targets.

Increase ammo in "Player.gd", should be less than the amount needed to remove all targets!

Test scene, should be able to fire on targets and they should disappear once their health hits 0.

### Collecting and Managing ammunition
Duplicate node "ground" and rename to "ammo".

Change "scale" to 1,1,1.

Move slightly above ground.

Create new group (or "tag") "ammo_gun" and apply to cube.

Add code from book to "Player.gd".

### Building a weapon management system with classes
Add script "Weapon.gd", add code from book.

Should have a constructor and classes to increase/decrease ammo.

Add script "WeaponInventory.gd", add code from book.

Should have constructor and functions to access Weapon class variables.

Open script "Player.gd", add code.

Open "Project" > "Project Settings" > "Input Map"

Type "change_weapon" in the action field and click "Add".

Add "Tab" as key for action.

Save and test scene. Should be able to change weapons with TAB.

Open "Player.gd", add code from book.

Should be able to reload.

Select node "player"

Add a child node of type "AudioStreamPlayer" to node "player".

Rename child node to "sound_fx"

Under "Properties" add "gunshot" file from "FileSystem" to "Stream" property.

Add code from book to "Player.gd".

Resize/reposition node "message" in 2d view so it covers a rectangle under to reticle.

Add code to "Player.gd" from book.

Should be able to see active weapon and how much ammo is in weapon.

### Managing the collection of ammunition
Open "Player.gd", add code from book.

Under "3D" add the "box_texture.jpg" from "FileSystem" to new "SpatialMaterial" on node "CSGBox" on node "ammo".

Don't just replace the texture as it's a duplicate of the "ground" node and will change the map as well!

Re-open "Player.gd" in script view, add code from book.

Save and test scene.

Under 3d duplicate the node "ammo" and rename to "ammo_gun".

Change node group to "ammo_automatic_gun". Remove the default "ammo_gun" group.

Move away from default "ammo" node if not already done.

Add new spatial material, drag and drop "box_texture_auto_gun.jpg" to texture on "ammo_gun" node.

Change "UV1" x scale under "Inspector" to -1 to fix reversed font.

Repeat process for an "ammo_grenade" node and group.

Add texture "box_texture_grenade.jpg".

Lastly change texture for base "ammo" node to use "box_texture_gun".

Save as scenes for re-use later.

Create "ammo_gun", "ammo_auto" and "ammo_grenade".

### Creating a grenade launcher

Create a new scene, select "Other Node" and choose type "RigidBody".

Name node "grenade".

Add a "collisionShape" node as a child to node "grenade".

Under "Inspector" set shape to "CapsuleShape"

Set Scale to .2, .3, .2

Finally add a "CSGSphere" node as a child to node "CollisionShape" node.

Save scene as "grenade.tscn".

Attach script to node "grenade", default name "grenade.gd" is fine.

Add code from book.

Re-open Player.gd, add code from book.

Open "training_camp" scene, select the node "Player"

Drag and drop the "grenade.tscn" scene from the "FileSystem" window to the new "Script Variables" menu.

Once that's done add additional code from book to the "Player.gd" script.

Save and test scene. Should be able to remove targets with grenades.

^^ Code doesn't work. At this point I'm done fixing this books jank...

### Quiz with answers
