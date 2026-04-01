# Chapter 2: Installing Godot and becoming familiar with the interface

## Overview
How to install and use Godot's interface.

## Notes
### Installing GoDot
This review was done on a machine running `Pop OS 24`. To install Godot run the following command: <br>
`sudo apt install godot3 godot3-runner` <br> <br>

### Understanding and becoming familiar with the interface
Tabs and panes: <br>
1. Top tabs, workspaces to visualize a 3D or 2D scene. Scripts included in scene and different assets.
2. Scene tab, Window (or view) lists all nodes currently present in scene. Can include shapes, 3D characters or terrains.
   View also makes it possible to identify hierarchy between nodes.
3. FileSystem tab, window includes all the assesst available and used for project such as 3D models, sounds or textures.
4. Bottom tabs, information related to actions in Godot as well as compile errors amongst other things.
   Info primarily related to animation, audio, compilation, messages from code and actions in Godot.
5. Inspector tab, displays info (properties) on the object or the node that is currently selected.
6. Play-Test Buttons, play/pause/stop/build the current project or scene.
7. View port, Tab in middle of screen displays content of a scene or item listed in Hierarchy view.
   Visualize and modify items accordingly.

### Discovering and Navigating through the scene.
3D Workspace hotkeys: <br>
* Rotate the view, middle mouse button + drag and drop
* Pan the view, middle mouse button + drag and drop + shift
* Zoom in and out, mouse wheel

Click "3D" to activate 3D workspace at top of window. <br>

Gizmo in upper right shows X,Y,Z planes. <br>

Focus a node by selecting the object in the scene tree and pressing the 'f' key. <br>

### The Scene Tree (or Scene Dock)
Lists and displays name of all nodes in scene. Alphabetical by default. Also shows relationship or hierarchy between items.

Scene tree is useful when need arises to manaage all nodes present in a scene and to perform organizational changes.
Find nodes based on name, find duplicate nodes, change node names, change node perperties, change hierarchy between nodes.

Drag and drop nodes to change hierarchy.

### Filesystem dock
Displays all assets in project and across scenes. Includes audio files, textures, scripts, materials, 3D models, scenes or packages.
Assets can be shared across scenes.

### The Inspector
Dock displays properties of currectly selected node from Scene Tree. Attributes can be modified from here.

By default nodes in a scene have a name. If they are spatial nodes they include attributes such as Transform (position, rotation, scale) attributes,
Matrix, and Visibility.

### The Bottom Panel
Includes tabs with information related to actions in Godot. Animation, audio, compliation, messages from code and actions in Godot.

Output tab will list all actions in Godot. Functions similarly to a log.

Debugger tab will include compilation errors.

### Asset library
Pre-built assets for projects.

## Post-chapter quiz w/ answers
1. To install Godot, you need to launch an installer. **False**.
2. Godot is a premium software. **False**. (Assumption is Premium = paid)
3. With Godot you can create both 2D and 3D games. **True**.
4. In Godot you can specifiy where your project will be saved. **True**.
5. Once an asset has been downloaded in the scene it is not available in other scenes withint the same project. **False**.
6. It is possible to make some nodes invisible in Godot. **True**.
7. To make some nodes children of other nodes, you can select a node and drag and drop it atop it's parent. **True**.
8. Godot is using a right-hand coordinate system. **True**.
9. Help on Godot is available online. **True**.
10. To rotate the current view in the 3D modes you can use the middle mouse button and drag and drop your mouse. **True**.
