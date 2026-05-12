# Chapter 6: Frequently Asked Questions

## Notes
### Scripts
* **How do I create a script?**
  In the "Script" workspace, select "File" > "New Script"
* **How can I check that my script has no errors?**
  Save your script and any error should be displayed underneath.
* **What is the dot notation for**?
  The dot notation refers to "Object-Orientated Programming".
  Using dots you can access properties and functions (or methods) related to a particular node.

### Interaction with assets
* **How do I detect collisions?**
  To detect collisions from the "First-Person Controller (player), and provided that it is based on
  a "KinematicBody" node you can use the function "get_slide_count".
* **How do I destroy objects?**
  To destroy an object, you can use the function "queue.free".
  For example to destroy a node called maze use the following code: <br>
  `get_node("../maze").queue.free()` <br>
* **How can I create a scoring system?**
  For a simple scoring system you can create an integer and increase it's value by one every time
  a player has collected an item.

### Using a graphical user interface
* **How do I create a text to be displayed onscreen?**
  Create a "Label" node.
* **How do I update a text to be displayed onscreen?**
  You need to find the "Label" node obj3ect and modify it's text attribute.
  So to display the message "Hello" using a label node with the name "messageUI" use the following: <br>
  `get_node("../messageUI").set_text("Hello")` <br>
* **How can I empty (i.e. delete) the text onscreen?**
  You just need to set it's text attribute to an empty string.
  For example the following code will empty the text field "messageUI": <br>
  `get_node("../messageUI".set_text("Hello")` <br>
* **How can I display the value of a specific variable onscreen?**
  You just need to access the "Label" node where you need to display this variable and set it's text attribute
  with additional text if need be.
  For example the following code displays the text "Score=" followed by the value of the variable "score": <br>
  `var score:int = 20` <br>
  `get_node("../messageUI").set_text("Score: " + str(score))` <br>

### Audio
* **What type of node can I use to play audio?**
  You can use a node of type "AudioStreamPlayer".
* **How do I play a sound?**
  - Create a node of type "AudioStreamPlayer".
  - Assign an audio file to this node.
  - Set the attribute AutoPlay to "On" or call the "play" function from that node.

### Detecting user inputs
* **How can I detect keystrokes?**
  You can detect keystrokes by using the function `_input`. <br>
  For example the following code detects when the key "E" is pressed: <br>
  `func _input(event):` <br>
  `    if INput.is_key_pressed(KEY_E):` <br>
* **How can I detect a click on a button?**
  To detect clicks on a button, you can do the following: <br>
  - Create a new "Button" node.
  - Create a new script and link it to this object.
  - Add this code to the script: <br>
    `func _ready(): ` <br>
    `    connect ("pressed", self, function_to_call)` <br>
  - Write the function "function_to_call"
