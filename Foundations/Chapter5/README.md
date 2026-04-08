# Chapter 5: Creating an Outdoor Scene with Godot's Built-in terrain generator

## Overview
Create an outdoor scene with water, terrain, elevation changes, and a car character to interact with it.

## Notes
### Importing necessary assets
Create a scene

Open AssetLib in top middle of screen

Search for "Heightmap terrain"

Download/Install

Double check work, should be a folder under FileSystem at res://addons/zylann.hterrain

Activate plugin under Project > Project Settings > Plugins

Check "Enable" box under status.

Go back to 3D view, select 3D Scene

Add child node to "Spatial", search for "terrain", select node "HTerrain".

Under "FileSystem" create a new folder at res:// name it for terrain data. Book uses "terrainData".

Select node under scene tree, locate "Data Directory" under Inspector, set it to new folder.

Copy "gameMapOutline.png" from resource pack folder to res:// in FileSystem dock.

### Creating the outline of the island
Select the node "HTerrain" in the scene tree.

Click "Edit" at bottom middle of screen. Click "+" on pop up. Click "Load..." under Albedo.

Add the "gameOutline.png" image.

Close the pop up. Map will be tiled, this is expected and will be adjusted next.

Select object, under "Inspector" find the "Script Variables" section.

Under "Rendering" and "Shader Params" set "U Ground UV Scale" to 500.

Book uses different names and paths of "scriptVariables" and Shader > Shader Params.

May be that way on older versions of GoDot 3.

Next select the HTerrain object and in the scene menu at the top of the viewport selecdt "Lower Height".

Object symbol is under horizontal menu labeled "Terrain", resembles a scooped mids EQ band.

Adjust Brush size to preference, books uses size of "11". For this review a much larger brush was used.

Lower the Blue areas on the edge of the map texture.

One lowered to a desired depth, use the "smooth" tool next to the "lower height" tool to smooth lowered textures.

### Adding water
Open AssetLib window

Search for "water"

Download + install "Basic Water Material"

Files should be at res://assets/maujoe.basic_water_material

Add Child node type "CSGCylinder" to "HTerrain" node

Set position (translation) to 250,-1,250

Set scale to 400, 1, 400

Under maujoe asset folder find "basic.water.material.material" and add it to the CSGCylinder material.
In this review the filepath was res://assets/maujoe.basic_water_material/materials

### Painting the island with realistic textures
Select "HTerrain" in scene tree view

Select Texture Paint from toolbar at top of viewfinder

Add texture, click Edit, and "+"

Select new texture, load and select the file "grass.jpg". If not in project folder, it'll be in the resource pack.

Repeat steps to add "sandy_color.png" texture as well.

Use the texture paint tool to paint over the tan and brown textures.

For this review the green dots were replaced with grass.

### Adding a lake and a mountain
Select the "Lower Height" tool.

Select a brush size of "34" and opacity of "100".

Book uses those values, for these notes a much larger value of "60" was used.

Drop the blue dot in the middle of the map to create the lake.

Use the smooth height tool on the lake.

Next use the "Raise Height" tool to a hill by the lake.

Book uses a brush size of "31" and an opacity of "80".

After hill is created cover it with grass texture. Use different opacities for different heights.

This review did not do that...

Add a child camera node to the Spatial node to preview the scene.

Set Translation to 220,40,20 and Rotation to 0,110,0

### Adding a car to the 3d environment
Open AssetLib

Search for "car"

Select "3D Car with Settingspanel"

Download + Install

Should be viewable in FileSystem at res://assets/3d_car_customizable.

Find the "car.tscn" asset and drag it on to the scene.

Created node "Car" should be a child node of HTerrain, move it if it's not.

Adjust Translation of car so it's right above the ground.

Book uses 282,5,190

This review found that a Y translation of "1" was much closer.

Hide the created camera node.

Added a child node to the "Car" object of type camera.

Change it's Translation and Rotation so it's slightly above and behind the car.

Book uses values of 0,2,-5 for Translation and -30,180,0 for Rotation. Adjust as needed/preferred.

This review used a slightly higher Y/Z translation of 3,-6.

At this point play the scene and drive the car using the arrow keys.

### Adding buildings to the island
Create box nodes, duplicate, position and resize to cover the Black squares.

Set Height/Scale as desired.

Add the "buildings.jpg" texture.

## Post-chapter quiz w/ answers
1. The "AssetLib" window makes it possible to download assets and plugins for Godot. **TRUE**
2. Once a library has been downloaded it needs installed. **TRUE**
3. The "Heightmap" terrain library makes it possible to create terrains in Godot. **TRUE**
4. The "Heightmap" doesn't need to be activated before it can be used in Godot. **FALSE**
5. Before using the "Heightmap" library a data folder needs to be created. **TRUE**
6. Only one texture can be applied to a Height Map created with the "Heightmap" library. **FALSE**
7. The "Heightmap" terrain library makes it possible to raise or lower part of a terrain. **TRUE**
8. It is possible to create a terrain with hills and valleys from a simple box object. **FALSE**
9. A camera can't be the child of another object. **FALSE**
10. The "3D Car Settings Panel" plugin makes it possible to add a car to a 3D scene in Godot. **TRUE**
