# Chapter 5: Creating an Outdoor Scene with Godot's Built-in terrain generator

## Overview

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
### Painting the island with realistic textures
### Adding a lake and a mountain
### Adding a car to the 3d environment
### Adding buildings to the island

## Post-chapter quiz w/ answers
