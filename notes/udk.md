---
title: Unreal Development Kit
layout: note
---

## Project Setup

TK

### Configuration Files

TK

## Unreal Frontend

TK

## UnrealScript

### Define Variable

	var int Answer;

### Define Variable Default

	Defaultproperties
	{
	Answer=42
	}

### Make Variable Available in UnrealEd

	var() int Answer;
	
	var(CategoryName) int Answer;
	
### Make Variable Availe in Config Files

	class Bar extends Actor
	placeable
	config(Game);
	
	var config int Answer;
	
	[Foo.Bar]
	Answer=42

### 

- Actor, Info, GameInfo, FrameworkGame, SimpleGame, UDKGame, UTGame, UTDeathmatch
- ACtor, DynamicSMActor, KActor, KActorSpawnable
- ACtor, Controller, PlayerController

### Object

#### Structs

Vector has X,Y,Z
	
Rotator has Pitch, Yaw, Roll
	Each is an int between 0 and 65536
	0 = 0 degrees
	8192 = 45 degrees
	16384 = 90 degrees
	32768 = 180 degrees
	65526 = 360 degrees

#### Functions

VSize(vect)


Normal(vect) returns vector
 Normalize ( rotator Rot ) returns a Rotator

Object.Normal ( vector A )

## UnrealEd

- Builder Brush (Red)
- BSPs
- Static Meshes
- Textures
- Materials
- Lightmass
- Matinee
- Kismet
- Particle System
- PhysX
- KActor		
- Post-Processing Effects
  - PostProcessVolume
  - WorldInfo
  - Master Chain
    - UberPostProcessEffect
- Terrain Creation
- Model Import
- Packaging

### Shortcuts and Keys

- Spacebar = Mode Cycle (Translate, Rotate, Scale)
- B = Toggle Builder Brush
- C = Toggle Collision info for Static Meshes
- D = Toggle Realtime (emitters/anmations) in 3D Viewport
- G = Toggle Actors/Grid (except Static Meshes)
- H = Toggle All Actors (including Static Meshes)
- O = Toggle Volumes in current viewport
- T = Toggle Terrain in current viewport
- W = Turn Static Meshes On/Off
- Home = Focus on Selected Object
- Control-Shift-Click = Select Brush via Surface
- Right-Click on Brush Tools to Edit Settings
- Right-Click on Vector to Use as Snapping point
- Control-Click to select multiple brushes
- Control-<number> = Set bookmark
- <number> = Jump to bookmark
- Alt-<number> = Switch View Mode
- F5 or Double-Click = Actor Properties
- F5 = Surface Properties
- F6 = Level Properties
- Shift-2 = Geometry Tools
- A+Left-Click = Add Actor
- L+Left-Click = Add Point Light
- S+Lett-Click = Add Static Mesh
- Alt+Left-Drag = Duplicate Item
- Shift+Left-Click = Apply Material to Surface

### Geometry Style

- Additive = Empty Space you added brushes to (build a building)
- Subtractive = Solid Space you subtract brushes from (dig a tunnel)3

#### CSG

- Add (Blue) = Control-A
- Subtract (Yellow)
- Intersect
- Deintersect

## Resources

- [Unreal Development Kit](http://udk.com/)
- [UDK Central](http://udkc.info/)
- [World of Level Design - UDK Tutorials](http://www.worldofleveldesign.com/categories/cat_udk.php)
- [3D Buzz - UDK Tutorials](http://www.3dbuzz.com/vbforum/sv_videonav.php?fid=292838127fecccd8b151c72003546386)
- [Game Development StackExchange](http://gamedev.stackexchange.com/)
- [Real2Unreal](http://streamlab.info/real2unreal/)
