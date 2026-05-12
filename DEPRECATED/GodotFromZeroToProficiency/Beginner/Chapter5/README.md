# Chapter 5: Polishing our game

## Notes
### Creating a splash screen for the game
Create a new scene, name scene "starting_scene".

Choose root node "User Interface"

Add child node type "Button" to root "Control" node.

Add fond under "Inspector".

Filepath differs from book, option under "Control" > "Theme Overrides" > "Fonts".

Cheese "New DynamicFont".

Drag and drop the "BebasNeue-Regular.ttf" file from the "FileSystem" tree onto "Font Data".

Add script "ManageButton" to node "Button".

Add code as listed in book.

Also add instructions label as shown in book.

Duplicate the "starting_scene" and rename it "ending_scene"

Rename button, change label.

Modify the "ManageButton" script as labeled in the book.

Modify the Player.gd script as shown in book.

### Displaying the score in each scene
Open "level1.tscn"

Duplicate "timerUI" label, rename to "scoreUI"

Position and resize as desired.

Modify "Player.gd" as shown in book.

### Displaying items collected as part of the user interface using images
Open "level2.tscn"

Add child node of type "TextureRect" to root "Spatial" node.

Rename to "petrol_can1_ui".

Drag "petrol_can.jpg" from "FileSystem" to "Inspector" > "TextureRect" > "Texture"

Change scale under "Control" > "Rect" > "Scale"

Duplicate nodes, rename and move.

Modify "Player.gd" with code from book.

### Adding sound effects
Open "level1.tscn".

Add node type "AudioStreamPlayer" to the root node "Spatial".

Select node, drag "beep.wav" from FileSystem > Audio to "Inspector" > "AudioStreamPlayer" > "Stream".

Modify "Player.gd" as shown in book.

### Playing background music
Open "level1.tscn".

Add child node of type "AudioStreamPlayer" to the root "Spatial" node.

Rename to "bgSound".

Drag and drop "FileSystem" > "audio" > indoor_bg_sound.wav" to "Inspector" > "AudioStreamPlayer" > "Stream".

Make sure "Autoplay" is on.

Select the song under "FileSystem" and under "Import" ensure looping is enabled.

For this review the process is "Loop Mode" set to "Forward" with a "Loop Begin" of "0" and a "Loop End" of "-1".

To give the player the option to turn off the music, open "Player.gd" and change code as shown in book.

### Adding a mini-map
Open "level1.tscn"

Add a child node of type "ViewportContainer" as a child of the root node "Spatial".

Add a child of type "ViewPort" to the "ViewportContainer" node.

Finally a child of type "Camera" to the "ViewPort" node.

Select "ViewPort" in the scene tree.

Under "Inspector" set x/y size to 300, 300

Should clear the "Warning" on the "ViewPort" node!

Select the "ViewportContainer" node

Position it in the 2D scene to the lower right.

Finally select the "Camera" node and change it's "position", "rotation" and "far" values as listed in the book.

Select "player" node

Add a child of type "CSGSphere" to node

Set scale to 1,1,1

Add a New SpatialMaterial material to node

Set it to a green color under Albedo.

Rename node to "green_dot", make sure it's selected for the next part

Change it's translation to 0, 100, 0

In Inspector select "Layers" three dots menu

Choose "Layer7"

Right click "player" node and open in editor

Select the "Camera" object.

Under "Inspector" > "Cull Mask" choose the three dot menu.

De-select Layer7

Return to "level1.tscn" scene.

Choose mini-map camera, change it's culling mask to only load "Layer7"

Add new sphere to node "ground" in "level1.tscn"

Add red spatialmaterial, set translation to 0,100,0 and ensure it's in Layer1 and Layer7

Open "level2.tscn". Add child nodes to "petrol_can" nodes

Add sphere nodes, set color (book uses red this review uses blue)

Set position to 0,100,0 and layer to Layer7

Repeat for other cans and plane.

Use a different color for the plane.

Open "Player.gd", add code as listed in book.

Book doesn't cover this, but under "Project" > "Application" > "Run" a default scene can be set.

Set to "starting_scene.tscn" if not done already. Play project with F5.

### Quiz with answers
1. The following code when linked to a button will call the function "load_level"
`func_ready():`<br>
`    connect ("pressed", self, "load_level")`<br>
**TRUE** <br>

2. The following code will laod the scene called "level1.tscn".
`get_tree().change_scene("res://level1.tscn")`<br>
**TRUE** <br>

3. Find and write the missing code so the script can check whether the name of the node linked to the script is "Button":
`if (MISSING CODE == "RestartButton"):`<br>
Answer: <br>
`if (get_name() == "RestartButton")`<br>

4. By default, a node of type "AudioStreamPlayer" will play a sound automatically when the scene starts.
**FALSE** <br>

5. An "AudioStreamPlayer" node can play WAV files.
**TRUE** <br>

6. A camera can only display one layer onscreen.
**FALSE** <br>

7. A node can be several layers.
**TRUE** <br>

8. It is possible to display the content of the images caputer by a camera using a "ViewPort" and a "ViewportContainer" node.
**TRUE** <br>

9. It is possible to hide or display a node from a scirpt using the node's attribute "visible".
**TRUE** <br>

10. It is possible to display text onscreen useing the node "Label".
**TRUE** <br>
