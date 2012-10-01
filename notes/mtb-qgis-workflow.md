---
title: Creating Mountain Biking Maps with Quantum GIS
layout: note
---

## Overview

- Goals
- Collaborators
- Data Collection
- QGIS Project Setup
- Importing Reference GPS Tracks
- Importing Reference Street and Water Data
- Generating Contour Lines from Elevation Data
- Digitizing Mountain Biking Trails
- Styling Your Map
- Composing a Printable Map

## GIS vs. Illustrator

TK

## Goals

We are trying to make a map that mountain bikers will find useful. There are a number of goals we need to achieve to make it useful. We need a map that tells mountain bikers:

- the name of the park
- the town the park is in
- nearby major roads so they can find the park entrance
- parking lots
- trail head locations
- the extent of the park and any private property or dangerous locations (e.g. shooting range) that are nearby
- the different trails and where they go and when they join up
- the colors and/or name of each trail
- the difficulty level of each trail
- elevation changes so they know when they're going to be climbing or descending
- reference locations in case they get lost or inured
- emergency contact infomation in case they get injured

That's a lot to achieve but it's not impossible!

## Collaborators

As you work on your map you are going to need to work with a number of people or groups:

- The parks department or land owner that owns/maintains the land the trails are on.
- Any mountain biking organziations that own/manage/maintain the trails.
- A point person that will tell you the official names, colors, difficulties and status of each trail.
    - This may be the parks department, land owner, mtb organziation or a dedicated rider that maintains the trails.
- Emergency response teams who might be using your map if somebody is injured in the park.
- The mountain bikers who ride at these trails.

## Data Collection

### GPS Tracks

### Elevation Data

### Streets & Water

## QGIS Project Setup

1. Create a dedicated directory for the project. e.g. `/Users/brian/Dropbox/Biking/909/`
1. Start **Quantum GIS**
1. Choose **File**, **New Project**
1. Choose **File**, **Project Properties...**
    - Under the **General** tab:
        - Set **Project title** to something readable: `Taconic-Hereford Multi-use Area (909)`
        - Set **Save paths** to `relative`
            - This keeps all data file paths relative to the project file and is useful when sharing/moving the project directory
    - Under the **Coordinate Reference System (CRS)** tab:
        - Check **Enable 'on the fly' CRS transformations**
            - This makes QGIS automatically transform files using other CRS to your chosen CRS
        - Choose **WGS 84 / Simpler Mercator** as your Coordinate Reference System
            - It's located under **Projected Coordinate Systems**, **Mercator**
    - Click **OK**
1. Chose **File**, **Save** to save your project in the directory you created above: `909.qgs`

## Reference GPS Tracks

Before I make a map of a park, I usually go out and ride it a few times with my Garmin GPS. This lets me collect my own data and also gives me a first person perspective of the trails which will come in handy when my GPS is a little bit off in places. It's a consumer-grade GPS, so it's accuracy is only so good.

### Combine GPX Files (Optional)

If you've ridden at the park several times (or have downloaded others recorded rides from a site like [Garmin Connect](http://connect.garmin.com/) then you might want to combine all your GPX files into one (or convert from KML to GPX, etc.). A great tool for doing this is [GPSBabelFE](http://www.gpsbabel.org/). You can choose multiple files of one type and combine and convert them to another.

<img src="/notes/images/gpsbabel.png" width="702" height="634" />

### Import Reference GPS Tracks

1. Create a sub-directory in your project directory called `gps`. e.g.  `/Users/brian/Dropbox/Biking/909/gps/`
1. Copy your .gpx files into this directory
1. Back in QGIS choose **Layer**, **Add Vector Layer**, **File** and click **Browse** to open a GPX file.
    - Make sure **Files of type** is set to `GPS eXchange Format [GPX] [OGR]`
1. Click **Open** to open your gpx file.
1. From the **Select vector layers..** dialog choose `tracks` and click OK.

You can repeat this for all your GPX files or you can use a program like GPS Babel to combine all your GPX files into one as described above.

<img src="/notes/images/qgis-gps-tracks.png" width="940" height="546" />

### Create a Layer Group for GPS Tracks (Optional)

If you decided to use a separate layer for each GPX file you can create a **Layer Group** so you can turn them all on or off at the same time.

1. Right-click in a blank area of the **Layers Panel** and choose **Add Group**
1. Name the group something like `GPS Tracks`
1. Drag and drop all your GPS layers into "GPS Tracks" group

### Style your GPS Tracks (Optional)

Depending on the default styling that QGIS randomly generates, you might want to tweak the styling to make it easier to trace later on.

It can be helpful to be able to turn off/on individual GPS layers but if they are all separate it can be a bit tedious to style them all the same way. This is another reason for combining them with GPSBabel.

1. Right-click on your "GPS Tracks" group and choose **Properties**
1. Choose the **Style** tab.
1. If there's a **New Symbology** button in the upper-right of the dialog, click it and choose **Yes* in the following dialog.
1. Change the **Width** to `0.25`
1. Change the **Color** to a medium gray.

## Import Reference Street Data

### Option A: OpenStreetMap

### Option B: Google Maps

- zoom to extent of map
  - right-click on GPS Tracks group and choose "Zoom to Group"
- plugins, openstreetmap, download osm data
  - change `Download To` to file in project folder

## Contour Lines 

### Find Elevation Data

### Load Heightmap

- use ??? to get heightmap data for area of map
- save heighmap file in project directory
- Layer, Add Raster Layer, select heightmap file
- move layer to bottom of Layers panel
- Edit, Toolbars, enable Raster
- choose your new layer and click Stretch Histogram to full dataset button on Raster toolbar.

### Crop Heightmap

This will speed up things like making contour lines

- Zoom to just outside the area you want to crop to
- Raster, Extraction, Clipper
  - choose output file, make sure to save in project directory
  - leave No Data Value unchecked
  - clipping mode: extent
  - click and drag on map to set area
  - use Command-` to get back to Clipper dialog
  - check `load into canvas when finished`
  - click `ok`
  - click `ok` on Processing Completed dialog
  - click `OK` on Input File Size dialog
  - click `Close` on Clipper dialog
    - clicking `OK` will attempt to click the image again
  - Remove or hide the original raster

### Computed -srcwin falls outside raster size...

## Generate Contour Lines

- select whatever_cropped raster layer
- ???

## Digitize Mountain Biking Trails

This is where you turn the all those raw, messy GPS tracks into beautiful lines on your map!

### Collect Trail Information

Before you start digitizing trails you're going to want to work with the people who decide what the trails are named, what color their blazes are and what difficulty level they are. This will save you the headache of having to re-adjust the trails you digitize.

Create a raw print of the map as it is and work with the trail owner to identify each trail. Use markers and pens to trace over the GPS tracks and mark them up so you know where trails begin and end, what their names are, what color they should be and their difficulty ratings. It also help you identify trails you might've missed (and will just have to ride to collect GPS tracks!), as well as determine which trails are closed and shouldn't be on the map. You'll use this marked up map as a reference in the next several steps.

***IMAGE OF MARKED UP PRINTED MAP***

### Create the Trails Shapefile

- Layer, New, New Shapefile Layer
  - Type: line
  - attributes:
    - name, text, 64
    - color, text, 64
    - difficulty, text, 64 
- save in project folder as `tracks`

### Digitize the Trails

- select `tracks` layer
- click `toggle editing`
- click `capture line`
- left-click along trail to digitize
- right-click to finish trail
- enter, id, name, color1 (and color2 if a combined trail)

## Digitizing LocationMarkers

Markers
- parking
- info kiosk
- trash
- bathrooms
- ruins
- sightseeing?

Bridges? (require rotation and size)

Technical Features
  - rock gardens
  - drops
  - rollers
  - skinnies (not very permanent)



New Shapefile
Points
type field
Capture Points

## Style the Map

Now that we've got everything digitized in your map, it's time to style it all and make it look good.

### Trail Styling

- right-click `tracks` layer
- select 'Properties'
- click **New Symbology** and confirm
- Select **Style** tab
- Select **Categorize** rule
- Choose **color** column
- Click **Classify** button

#### Duo-colored Trails

Improvements TK

## Create Print Composer

- File, Composer Manager
- Add
- Rename `Print`
- Close
- Size: ANSI A (8.5 x 11)


## Resources

* [QGIS]()
* [GPSBabelFE](http://www.gpsbabel.org/)

## Notes

### To Do

- Look into OpenStreetMap licensing/usage rights
- Look into elevation data usage rights

### Open Question

- How to limit which roads are shown?
  - Manually re-digitize only the ones I want to see.
  - style based on some attribute I add?

## QGIS Wish List

- Ability to copy/paste/duplicate labels in the Print Composer

### Misc.

- Create a dedicated directory for each mapping project and store all files associated with that project in the dedicated directory.
- Ride the trails and collect GPS data using my Garmin (gpx files)
- Download public GPS tracks from other riders (gpx files)
  - [Garmin Connect](connect.garmin.com)
  - ?MapMyRide?
- Create rough draft map using GPS routes
- Identify trail maintainer(s)
- Send rough draft to trail maintainer
- Work with the trail maintainer(s) to identify legal trails, names, etc.
- Identify associated mountain biking groups
  - get their logo
- Digitize the legal trails
- Identify, catalog and digitize
  - bridges
  - emergency routes
  - fire roads
  - intersections
  - parking areas
  - regular roads
  - singletrack
  - trail features
  - trail heads
  - trail names
- Search for topographical data for the area to generate contour lines
- Output a PDF of the map
- Share the geodata for others 
