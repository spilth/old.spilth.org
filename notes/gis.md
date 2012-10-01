---
title: Geographic Information Systems
layout: note
---

A GIS stores geographically located data that you can visualize on a map.

* Geographic - The data stored in a GIS is geographically located
* Information - GIS stores two types of information: Features and Attribute
* System - GIS is a computer system used to perform a variety of functions on geographic information

## Information

### Features

Features represent:

* Natural Objects
 * Continents
 * Rivers
 * Objects
* Human-defined Objects
 * Countries
 * Census Tracts
 * Parcels

### Attributes

Attributes describe features in a GIS.

Examples of Attributes are:

* Name
* Population
* Area

## System

A GIS System consists of several integrated components:

* Graphics program to draw maps
* Database that links features and attributes
* Tools to analyze, edit and manage geographic data

## Maps

### Paper Maps

* A picture of where things are
* Static

### Digital Maps

* Viewed on a computer
* May be static
* Some have dynamic tools (search, zoom, pan)
* Limited, compared to a GIS map

### GIS Maps

* More than a map
* Database behind it
* Provides Tools
 * Bring data in
 * Display data in various ways
 * Look at data together
 * Analyze data to generate new info
* Answer questions

## Functions of a GIS

* Visualization - looking at different views of your data to gain information and see relationships
* Geodata Management - organizing and updating geographic data to make it useful
* Analaysis - applying GIS tools to geographic data to answer questions and make decisions

## Geographic Approach

* Collect and organize data better to understand the earth
* Analyze data to create geographic knowledge
* Appy geographic knowledge to find solutions

## Features

Features represent real world objects on a map such as buildings, roads or tress.

Features consist of four components:
* Shape - point, line or polygon
* Location - latitude/longitude
* Symbol - shaper, color, outline, pattern
* Attributes - information that describes the feature

## Layer

A layer is a collection of features that represent the same theme, such as:

* Peaks
* Roads
* Lakes

Features in a layer have the same shape and same set of attributes.

## Scale

Scale is the relationship between the size of the feature on a map and its actualy, real-world size. Scale represents the amount of reduction and either express as a ratio or an equivalence:

* Ratio - 1:24,000 (feature is 24k smaller on the map)
* Equivalence - 1 Inch = 5 Miles

## Vector Data

Vector data uses shapes to represent features:

* points
* lines
* polygons

Features have a location or coordinates.

* One coordinate = a point
* Two or more connected coordinates = a line
* Multiple lines that are closed off define a polygon

Vector data is good for identifying features with distinct boundaries.

## Raster Data

Raster data represents continuous data such as precipitation, ground cover or terrain.

Raster data uses cells to store continuous data. The cells are arranged in rows and columns. All cells are the same size and each stores a value (a measurement or a code).

Rasters have an origin, position and size.

## Feature Class

A Feature Class is a collection of features that share the same shape and attributes. A Layer is a visual representation of a Feature Class on a GIS map.

Feature Classes have a table to store geometry (shape and location) and attributes. Each row represents one Feature and each column represents an Attribute.

## Thematic Map

On a Thematic Map features are symbolized based on an attribute. This helps convey more information than a map on which all features have the same symbol. The attribute used has a Category or Quantity.

* Categories represent different names, types or conditions and use a different symbol to to differentiate them.
* Quantities represent different amounts, percentages or ranks and use a changing symbol size or color.

### Classes and Classification Schemes

Features that are grouped by attribute values (a range of values) are called a class. The method used to create classes is called a Classification Scheme.

"Natural Breaks" (or Jenks) is a Classification Scheme that's appropriate for most data.

## Map Layout

A map layout is a product that will be shared with others. It should always include:

* Map Body
* Legend
* Scale Indicator
* Title

You add and arrange map elements to design the layout.

## Analyzing Geographic Data

A query is a question about features. The result of a query is a set of features.

There are two types of queries:

* Attribute query - searching for attributes that have specific values
* Location query - searching for locations that meet certain criteria

### Attribute Query

A Query Expression consists of three parts:

* attribute field - what you're interested in
* operator - the type of comparison you want to make
* attribute value - the value you want to compare against

Example: "STATUS" = 'COUNTY SEAT'

A compound query can be created by using Connectors to combine individual queries.

Example: "STATUS" = 'COUNTY SEAT' AND "COUNTY" = 'LAKE COUNTY'

### Location Query

A Location Query is used to find features with locations that meet certain conditions. You find features based on their location relative to other features.

There are four types of feature location relationships:

* Near - with distance of X
* Adjacent - features that touch or share a boundary with other features
* Intersecting - features that intersect, cross or overlap
* Inside - features that are completely or partially inside other features

A Location Query includes:

* layer with source features
* type of location relationship
* layer with related features

### Buffer

A Buffer is a zone of specified distance around one or more features in a layer. Creating them is a common operation. Buffers are often combined with other layers to create new data and information.

To create a Buffer you:

* specify the layer that contains features you want to buffer
* specify the desired distance

The output of a Buffer is a new dataset with polygon features.

### Overlay

Overlaying is superimposing one layer of data on top of another. They are used to define where multiple conditions exist. They can also be created by combining two datasets to create a third dataset (with either all the combined attributes or a subset)

## Geographic Inquery Process

1. Ask Questions - where, why, what if
2. Acquire Data
 a. Decide what data you need
 b. find, derive or create the data you need
3. Explore
4. Analyze
5. Act
