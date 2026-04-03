# Chapter 3: Creating and exporting first scene

## Overview

## Notes
### Adding and combining simple built-in objects to scene
In the "Scene Tree" tab, there's a message to create a Root Node.

Click "3D Scene".

Right click node called "Spatial".
Select "Add Child Node".
Search for "box" in the search field.
Select "CSGBox". Creates a box located at 0,0,0 with a size of 1.

Rename cube. Multiple ways to do so. Easiest listed was to double click the name.
Book goes with "myCube", used to keep consistent.

In Inspector window use "Transform" to change x,y,z scale and change the size of the cube.

Three toolbar shortcuts with hotkeys to: <br>
1. Move the selected object, W
2. Rotate the selected object, E
3. Scale the selected object, R

Remember middle mouse + dragging the mouse will pan around the object.

Remember middle mouse + shift + dragging the mouse will pan the view.

Pressing F will refocus the view on the selected object.

Clicking the Gizmo letters X,Y,Z will set the focus in a 2d perspective.

I.E. X,Z, Y,Z, X,Y

Can also be done from perspective dropdown.

Using W, E, and R toolbar shortcuts will illustrate what changes will be made.
I.E. Rotation will change the movement arrows to round rotation indicators.

To reset use the round arrow next to the "Transform" attributes.

### Adding Colors and Textures

Reset the box if not done already by clicking the round reset arrows under "Transform".
This will be "Translation", "Rotation Degrees", and "Scale".

Select the node called "Spatial" in the scene tree.

Right click, Add Child Node, search for "Camera" and Create.

Make sure the camera node is active, select the "Preview" option.

Can split the view with Control + 2 to view both viewport and camera view.

Go back to single view with Control + 1.

Disable preview mode if not already done.

Create new child node on Spatial, search for "DirectionalLight", create.
Book renames node to "myLight".

Orient camera so it's above the cube and pointing downwards.
Select the node.
Select Transform.

Translation and Rotation should be 0,0,0 to start.

Move the light along y axis. Translation 0,3,0

Rotate the light -90 degrees along the x axis. Rotation -90,0,0

Next move the camera above the cube to match the light.
Select the "Camera" node and adjust the Translation/Rotation to move the camera slightly above the light.
Book uses Translation of 0,4,0 and Rotation of -90,0,0

Once camera is in position change the light color.

Select light node, under inspector find the "light" dropdown. Select the color box, pick a color.

Next create the ground from a box.
Select the cube, change it's scale properties to 40,1,40
Rename the cube from "myCube" or whatever name was chosen to "ground".

Next add texture.
Select the new ground object, under inspector find the "CSGBox" section and the "Material" dropdown.
Select "New Spatial Material".
Select the resulting sphere, look for "Albedo" option.
Add the "tile.jpg" texture from the resource pack. A zip file + export is in this repo.

Will depend on OS, but on Linux it was dragged and dropped from file manager into FileSystem dock.
From FileSystem dock, drag the "tile.jpg" texture to the "Texture" menu under Albedo for the sphere.
If done correctly, the ground texture will change color to reflect the new file.

To tile the ground texture select the object "ground" in the scene tree: <br>
1. Location the "CSGBOX" section.
2. Click on the sphere to the right of the Material label.
3. Locate the "Uv1" section.
4. Change the "Scale" property. Book uses 5,5,5

### Adding Multicolor boxes and stairs
Modify the light so it illuminates the scene.
Select the light object, change it's "energy" attribute under the light section to "10".
Change it's y coordinate to 10.

Add a new child node box.
Name it "redBox".
Change the y coordinates so it's above ground. Book uses 0,2,0
Change it's material to "New Spatial Material"
Change the Albedo color to some shade of red.

Once done select the box and either use the hotkey Control + D or right click and select "Duplicate".
Move new box alone x axis with method of choosing.
Change name to "greenBox".
Change Material to "New Spatial Material".
Do not just change the color, it will change the original color as well.
Once new texture is applied, color can be safely changed under Albedo.

Repeat the duplication one more time and move the new box along the X axis so it's not under the original box.

### Creating a simple staircase
Hide the objects that aren't set to be duplicated. In this example it's "redbox" and "greenBox2".

Click the eye symbol next to the object name under "Scene".

Change the scale of the remaining object "greenBox" to 1.5,0.2,1.

Duplicate the item three times, should be greenBox3 -> 5

Postion them in a way to create a staircase. Example the book uses:
* greenBox  3, 2, 0
* greenBox3 6, 2.5, 0
* greenBox4 9, 3, 0
* greenBox5 12, 3.5, 0

Other values will probably work

### Managing and searching for assets and objects
Use the search box under "Scene" to search for assets.

Enter box and all the box items will show.

Enter "green" and all the green boxes will show.

The FileSystem tab search also works the same way.

Searching for "tile" will show the texture file.

The "Inspector" menu "Filter properties" will function the same way.

Searching for "Mat" will show the material among it's results.

Next group the stair items together.

Right click the "Spatial" node, add a child node and select "Spatial". May need to search for it.

Name it, then move all the staircase items to the node. Book uses "container-parent" as the name.

Double check that the files moved correctly by selecting the spatial node and the "move" option in the viewfinder.
All the staircase items should be selected together.

### Building and exporting our scene
Save scene if not done already.

Project > Export

Select "Add..."

Select OS. This review was done on a Linux machine so that is the option chosen.

Should see messages of missing templates if run for the first time.

Select "Manage Export Templates", follow guide.

For this review the following was used:
Current Version: 3.5.2.stable
Download from: Best Available mirror
Download and Install

Close menu once it's done.

Book uses "install from file" method.

Before exporting set scene for exported game.

Project > Project Settings

General > Run

Select the folder next to "Main Scene" and choose created scene.

Go back to Project > Export

Export Project...

Should ask for filepath. For this review the exported project was saved to repo.

Should be able to open exported game from there.

## Post-chapter quiz w/ answers
1. In Godot, all files and scenes are by default saved in the FileSystem dock. **TRUE**
2. Al objects are usually represented as nodes. **TRUE**
3. It is possible to apply a texture or color to a cube. **TRUE**
4. The RGB code is used for colors. **TRUE**
5. The key W is the shortcut for the Move key. **TRUE**
6. The key E is the shortcut for the Scale key. **TRUE**
7. The key R is the shortcut for the Rotate tool. **TRUE**
8. It is possible to preview the scene when a camera has been added. **TRUE**
9. It is possible to preview the scene when no camera has been added. **FALSE**
10. A transformation applied to a Spatial node will also be applied to all it's child nodes. **TRUE**
