---
title: Blender
layout: note

---

## MacBook Pro Setup

When using Blender on my laptop I don't have a middle mouse button (used for view rotation and panning). Blender allows your to emulate a third mouse button by using Alt + Left Mouse Button:

In the ``Info`` view:

* Click ``File`` and choose ``User Preferences`` (or Command + ,)
* Under the ``Input`` table check ``Emulate 3 Button Mouse``
 * Alt + LMB is now Middle Mouse Button (MMB)
* To have this as the default settings click ``Save as Default``
	
## General

* RMB = Select Object
* LMB = Place 3D Cursor
* Space = Search Menu (in View)

## Things I Will Likely Forget

* Shift-S = Snap Menu
* Ctrl-L = Loop Cut and Slide

## Camera

* MMB (Alt+LMB) = Rotate
* Shift+MMB  (Shift+Alt+LMB) = Pan
* Mouse Wheel = Zoom

## 3D View

* Rotate View = MMB
* Pan View = Shift+MMB

* Numpad 5 = Toggle Perspective/Othrographic
* Numpad 0 = Toggle Camera/Last View

* Numpad 7 = Top View
* Numpad 1 = Front View
* Numpad 3 = Right View

* Numpad 4/6 - Rotate View Left/Right
* Numpad 8/2 - Rotate View Up/Down
* Numpad - = Move Back
* Numpad + = Move Forward

* Control+Numpad-4/6 - Pan View Left/Right
* Control+Numpad-8/2 - Pan View Up/Down

* Control-Alt-Q = Toggle Quad View (4 viewports)

* T = Tools Shelf
* N = Properties Shelf

### Selection
	
- Select = RMB
- Select All/Deselect = A
- Lasso Selection = Control + LMB
- Border (square lasso) = Press B then click and drag

### Mode

* Tab = Edit/Object Mode
* Ctrl-Tab = Toggle Weight Paint Mode
* V = Toggle Vertex Paint Mode

#### Edit Mode Context Menus

* Control-V = Vertex Menu
* Control-E = Edge Menu
* Control-F = Face Menu

### Edit Mode

* Ctrl-Tab = Switch Vertex (1), Edge (2), Face (3) Selection

* Shift-A = Add Object
* X = Delete

* Shift-D = Duplicate
* F = Make Edge/Face
* E = Extrude
* Ctrl-E = Mark Seam

## 3D View Grid

- Enable the 3D View Properties Shelf (n)
- Open the ``Display`` section
- Enable ``Grid Floor``
- Adjust ``Lines``, ``Scale`` and ``Subdivisions``

## Camera

* Ctrl+Alt+Num0 = Align Camera to Current View

### Orthographic Camera

- Select Camera with Right-click
- Open Camera Panel (Object Data) in the Properties Panel

## Show Vertex & Face Normals Normals

- Switch to ``Edit Mode`` (Tab)
- Open the 3D View Properties Shelf (n)
- Open the ``Mesh Display`` section
- Under the ``Numberics`` section:
	- Enabled Vertext and/or Face Normals
	- Adjust the ``Size`` to your liking 

- Enable the 3D View Properties Shelf (n)
- Open the ``Display`` section
- Enable ``Grid Floor``
- Adjust ``Lines``, ``Scale`` and ``Subdivisions``

- 3D View properties window (n)
	Mesh Display, Normals

## Recalculate Normals

- Press Control+N

## Remove Duplicate Vertices

- Select the object with duplicate vertices
- Switch to ``Edit Mode`` (Tab)
- Select duplicate vertixes/edges (or A to select all)
- You can either
	- Enable ``Mesh Tools`` (T) and the ``Remove`` section click ``Remove Doubles``
	- Open the Specials Menu (W) and choose ``Remove Doubles`` (4)

``Info`` editor will show how many vertices were removed. Ex: "Removed 2 vertices"

## Adjust Objects Center Point

TK

## Shading Mode

* Z = Solid/Wireframe Mode
* Shift-Z = Shaded/Wireframe Mode
* Alt-Z = Textured/Solid Mode

## Snapping

* Shift-Tab = Snap Settings?
* Control+Move = Snap to Grid (while Grabbing)

## Panels

* F4 = Logic
* F5 = Shading
* F7 = Object
* F9 = Editing
* F10 = Scene
* F12 = Render

* G = Grab Object
* R = Rotate Object
* S = Scale Object

## Unsorted

Screen Layout

isometric = 35.264 / 54.736
dimetric = 
oblique = 


isometric = equal measure


- vertex editing
- apply textures

	
Transform Orientation (Alt+Space)
	Global
	Local
	Gimbal

## Mesh Tools

- right-click to select vertex
- click and drag vertex to move it
- control-click and drag vertex to snap to grid

## Ambient Occlusion

Under the World Properties

## Object Origin

* Shift-Ctrl-Alt-C = Set Origin


### misc

Control-Space = 

tab
x





Mark Seam


Loop Cut = Control-R



UV Unwrap
- edit mode
- u,u


Subsurface Modifier


Shift+Space = Maximize Window



Shift-S = Snap Menu

Shift-B = Zoom Border


G, Z = Grab and Move along Z axis
G, Shift+Z = Grab and move along X and Y


Shift-G = Select Similar

Shift-F = Fly Mode? (Esc or Space to exit)
	A = Left
	D = Right
	W = Forward
	S = Backward
	R = Up
	F = Down
	
## Resources

* http://www.blenderguru.com/
* http://www.blendernation.com/category/education/tutorials/
* http://www.blenderdiplom.com/
* http://cgcookie.com/blender/category/tutorials/
* http://cg.tutsplus.com/category/tutorials/blender/
* http://www.cgmasters.net/free-blender-3d-tutorials/
* https://vimeo.com/channels/blendertuts
