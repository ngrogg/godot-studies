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

### Creating a grenade launcher

### Quiz with answers
