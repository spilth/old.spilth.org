---
title: Quantum GIS
layout: note
---

## Lines

### Create a Line

1. Choose the Layer you want to add a line to.
1. Click Layer, Toggle Editing to turn on editing.
1. Click Edit, Capture Line (Command-/).
1. Click to place points.
1. Right-click to place final point.
1. Enter attributes for the line.

### Move points on a line

1. Make sure Editing is turned on
1. Click Edit, Node Tool
1. Click and hold on Node to move Node
 * Command-Left-click to select multiple nodes
1. Click and hold on Segment to move Segment

### Add a Node to a Line Segment

1. Make sure Editing is turned on
1. Click Edit, Node Tool
1. Double-click on Line Segment to create a node there

### Delete a Node in a Line Segment

1. Make sure Editing is turned on
1. Click Edit, Node Tool
1. Click to select a node
1. Press Delete key (Function + Delete on MacBook Pro)

### Split a Line into two Lines

*This appears to have changed?*

1. Make sure Editing is turned on
1. Click Edit, Split Features
1. Draw line across Segment you want to split at by clicking on one side and right-clicking on the other side of the line
1. Click View, Select, Select Single Feature and click to confirm split pieces

### Merge Multiple Lines

1. Make sure Editing is turned on
1. Click View, Select, Select Single Feature
1. Click the first Line
1. Command-click additional lines
1. Click Edit, Merge Selected Features
1. Use dialog box to pick which attribute values to apply to the merged line

## Generate Contour Lines from Heightmap

1. Select Heightmap Layer
1. Click Raster, Contour
1. Choose the input Raster Layer
1. Choose an output file
1. Choose interval for contour lines
1. Choose Attribute with elevation information (optional)
1. Check "Load into canvas when finished"

## Convert Meters to Feet for Contour Lines

TK

## Add Folder of SVG Symbols to QGIS

1. Click QGIS Menu
1. Click Preferences,
1. Click Rendering Tab
1. In SVG Paths section click `Add`.

## Open Questions

* How to merge nodes?
* How to continue adding nodes to a completed line?
  * Use Reshape?

