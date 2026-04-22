# Chapter 4: Creating and updating a User Interface from your code

## Notes
### Setting up a the scene
Open "godot_beginner_start_project".

Open "scene1.tscn" from last chapter.

Select "box_to_collect" scene tree.

Save branch as scene, book uses "box_to_collect.tscn".

Open "level1.tscn" scene, deactivate ceiling so maze is visible.

Select the "Spatial" node in the scene tree so asset is a child node for root node.

Drag and drop the "player.tscn" under "FileSystem" into the scene.

Make sure resulting "KinematicBody" node is a child node of the "Spatial" node.

Make sure maze is viewed from above.

Rename node to "player" and set "Transform" under "Inspector" to 1 for Y.

At this point test the scene.

### Creating a timer
Add child node of type "Node" to "Spatial Node"

Rename to "timer"

Attach script to node, default values are fine.

Add code from book.

Test scene, should see timer in output window.

Add child node "label" to Spatial node.

Move to "2D" view if Godot doesn't automatically change.

Resize, change name to "timerUI"

Under Inspector, nagivate to Fonts.

In this review this was under "Control" > "Theme Overrides" > "Fonts"

Add new Dynamic Font

Select Dynamic font dropdown and choose "Edit"

Drag "BebasNeue-Regular.ttf" from "FileSystem" to "Font" > "Font Data"

Set size as desired.

Add "Test" to label to make sure font shows.

Add code from book to script and test scene.

Duplicate "timerUI" node, rename to "userMessageUI".

Move to middle of screen in 2D view.

Use "Align" and "V Align" at Center.

Add code from book, save and test scene.

### Collecting boxes and displaying messages accordingly

### Deleting the user messages after a few seconds

### Displaying a dynamic message for the boxes collected

### Rotating objects to be picked up

### Collection petrol cans in the secon

### Activating the spacecraft

### Quiz w/ answers
