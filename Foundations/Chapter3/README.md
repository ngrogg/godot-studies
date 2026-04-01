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

## Post-chapter quiz w/ answers
