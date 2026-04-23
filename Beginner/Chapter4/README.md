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
Select the 3D view.

Select the "Spatial" node so any created items are child nodes of the root node.

Drag and drop a "box_to_collect.tscn" item from "FileSystem" to add to the map.

Set Y translation to "2".

Open Timer script, adjust with code from book.

Open Player script, adjust with code from book.

Group nodes from current scene under a new node "maze".

New "maze" node should be a child node of the "Spatial" root node.

Leave labels and player item as children of the root "Spatial" node.

Edit the "Player" script with code from book.

### Deleting the user messages after a few seconds
Add new child node of type "Timer" to the Spatial node.

Under Inspector > Node > Signals choose "timeout()"

Select the "player" node.

Make sure the receiver method is `on_Timer_timeout`.

Fill in with code from book.

### Displaying a dynamic message for the boxes collected

Modify "Player.gd" with the code from the book.

Test scene.

### Rotating objects to be picked up
Right click on "box_to_collect" node

Select "Attach Script", book uses "Attach Node Script" but this review shows "Attach Script".

Enter "res://RotateBox.gd" as the path.

Add code from book.

Attach script to other three boxes and test scene.

### Collecting petrol cans in the second level
Open "level2.tscn".

Duplicate file "box_to_collect.tscn" as "petrol_can_to_collect.tscn".

Open "petrol_can_to_collect" scene.

Remove Node > Groups group "pick_me".

Create a new group "petrol-can" instead.

Select "CSGBox" and replace material with a new spatial shader material. Color it blue.

Save scene if not done already.

Go back to "level2.tscn".

Add petrol can item, make sure Y translation is "2" and that item is a child node of Spatial root node.

Duplicate item at least twice.

Open "Player.gd" script, add code from book.

It's not in the book, but as part of this review the "rotation" script was attached to the cans as well.

It's probably better to attach the rotation script before duplicating the items.

### Activating the spacecraft
Add code from book to "Player.gd"

May need to enable "Autowrap" on userMessageUI node under "Inspector".

Resize UI if needed.

### Quiz w/ answers
1. A new label can be added using the node "Label". <br>
**TRUE** <br>
2. The following code will empty the text node name `userMessageUI` provided the variable `user_message_ui` has been linked to this node: <br>
`user_message_ui.set_text("")` <br>
**TRUE** <br>
3. A "Label" node can be resized or moved. <br>
**TRUE** <br>
4. Find the error in the following code: <br>
`onready var userMessageUI:Label = get_the_node("../userMessageUI")` <br>
`onready var userMessageUI:Label = get_the_node("../userMessageUI") #get_the_node` <br>
5. Any scene can be duplicated using the shortcut `Control + F` <br>
**FALSE**<br>
6. If the scene `level4` has bene created and saved as `level4.tscn` it can then be loaded with the following code: <br>
`var new_scene = load("res://level4.tscn").instance()`<br>
`get_parent().add_child(new_scene)`<br>
**TRUE** <br>
7. The following code should execute with no errors: <br>
`var score:int = 2`<br>
`print("Score: " + str(score))`<br>
**TRUE** <br>
8. The following code should execute with no errors:  <br>
`var score:String = "2"`<br>
`print("Score: " + score`<br>
**TRUE** <br>
9. The following code will rotate the object linked to the script by 90 degrees every second: <br>
`func _process(delta): `<br>
`    rotation_degrees.y += 90*delta`<br>
**TRUE** <br>
10. The following code will rotate the object linked to the script by 90 degrees every second: <br>
`func _process(delta): `<br>
`    rotation_degrees.y += 90`<br>
**FALSE**<br>
