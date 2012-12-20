--- 
layout: post
title: Adventures in GIS
tags: 
- Biking
- GIS
status: publish
type: post
published: true
meta: 
  superawesome: "false"
  _edit_last: "255394"
  jabber_published: "1310928588"
  email_notification: "1310928589"
  _wpas_done_twitter: "1"
---
Instead of a retrospective of my year goals (of which I'm two months behind!) I wanted to reflect on something I've been put a lot of time and energy into recently: Geographic Information Systems

<a title="iTrail by spilth, on Flickr" href="http://www.flickr.com/photos/spilth/3763785961/"><img class="alignright" src="http://farm4.static.flickr.com/3461/3763785961_75b73567b4_m.jpg" alt="iTrail" width="160" height="240" /></a> Shortly after taking up mountain biking two years ago, I bought myself a GPS - a <a href="https://buy.garmin.com/shop/shop.do?pID=10885">Garmin Edge 705</a>. I had been using an iPhone app before that but soon found that it quickly drained my battery. I didn't want to be out in the woods and not know where I was or be able to call somebody. That's why I decided to get a dedicated GPS device. Or at least that's how I justified getting a new expensive toy...

Once I had the Garmin I started uploading <a href="http://connect.garmin.com/explore?owner=spilth">my mountain biking rides on Garmin Connect</a>, as well as tracking <a href="http://www.dailymile.com/people/spilth">my exercise on DailyMile.com</a>. Additionally I was looking at my rides using <a href="http://www.garmin.com/garmin/cms/us/onthetrail/basecamp">Garmin BaseCamp</a> and <a href="http://www.google.com/earth/">Google Earth</a> to see how things looked in 3D!

At some point I bought a copy of <a href="http://pragprog.com/book/gsdgis/desktop-gis">Desktop GIS</a> but I don't remember when or why I did that. I remember going through some of the examples but eventually losing interest and finding the software they used to be very buggy.

The main place I started out mountain biking at was <a href="http://wmba.org/blog/parks/graham-hills-park/">Graham Hills Park in </a> and some members of the <a href="http://www.wmba.org">Westchester Mountain Biking Association</a> were <a href="http://www.wmbaforum.tommychurch.com/viewtopic.php?t=6993">asking for an updated map of Graham</a>. Since I own Adobe Illustrator I decided to take a stab at making something that looked good using the GPS tracks, print outs, hand drawn maps and Google Maps and Google Earth.

<a title="Graham Hills Park - Work in Progress by spilth, on Flickr" href="http://www.flickr.com/photos/spilth/4507344004/"><img src="http://farm3.static.flickr.com/2256/4507344004_100c1c1219.jpg" alt="Graham Hills Park - Work in Progress" width="500" height="402" /></a>

It was well received and I ended up working with <a href="http://parks.westchestergov.com/">Westchester County Parks</a> to put together an official map. You can download the final map here: <a href="http://wmba.org/blog/wp-content/uploads/2010/05/graham-hills-park.pdf">http://wmba.org/blog/wp-content/uploads/2010/05/graham-hills-park.pdf</a>

<a title="Graham Hills Park Map - Work In Progress by spilth, on Flickr" href="http://www.flickr.com/photos/spilth/4791663315/"><img src="http://farm5.static.flickr.com/4079/4791663315_97b765fb7c.jpg" alt="Graham Hills Park Map - Work In Progress" width="500" height="392" /></a>

At the end of last summer another trail project was starting up. This time it was the <a href="http://www.nynjtc.org/">New York - New Jersey Trail Conference</a> working with the WMBA on some multi-use trails up in Yorktown called the <a href="http://www.nynjtc.org/group/yorktown-community-trails">Yorktown Community Trails</a>. I offered to help out with the maps of those parks and have been working on them the last few months.

<a title="woodlands-park-013 by spilth, on Flickr" href="http://www.flickr.com/photos/spilth/5946907633/"><img src="http://farm7.static.flickr.com/6030/5946907633_bdc432e0bb.jpg" alt="woodlands-park-013" width="500" height="388" /></a>

One of the painful parts of using Adobe Illustrator for making maps is getting images/screenshots from various applications and sites to line up correctly. Once that's done tracing trails is fairly easy. I have things organized into several layers to make it easier to manage styles, colors and layer order. Another painful step is getting contour lines into Illustrator. On top of aligning everything correctly, it can be quite time consuming and wrist stiffening to trace all the contour (height) lines that make a hiking/biking map more useful. To cap it all off, all these lines are just that - lines. They have no data associated with them. Nothing about the trail name, length, height or difficulty level. So I started looking at GIS again to see if it could help me produce equal quality maps that also contained data which I could use to style the maps.

I started by taking a course on GIS by the GIS masters (or at least the giant), <a href="http://www.esri.com/">ESRI</a>. ESRI produces a number of GIS applications and they are all insanely expensive for somebody doing volunteer work in their spare time. But they have a 60 day trial of their software so I figured I might as well see what all the hoopla was about. I put several hours into <a href="http://training.esri.com/acb2000/showdetl.cfm?DID=6&amp;Product_ID=976">Getting Started with GIS</a> and ended up getting a 100% on the final exam. Woo! Go me! It was an insightful course and definitely taught me a number of things.

I had to keep in mind that the software is several thousand dollars so I needed to check out some cheaper alternatives. I'm a Mac user so it reduces the number of available applications a bit. After playing with a number of different applications (from expensive to free) I've settled on <a href="http://www.qgis.org/">Quantum GIS</a>. It's a free multi-platform GIS application that supports a good number of features and is also extensible using Python or C++.

I'm still figuring out my map making workflow, but it currently goes something like this:
<ol>
	<li>Pick the park I want to make a map of</li>
	<li>Collect GPS data of trails from the park (either by riding their myself or finding routes online at places like Garmin Connect)</li>
	<li>Combine the GPS data using <a href="http://www.gpsbabel.org/">GPSBabel</a></li>
	<li>Load the GPS tracks into Quantum GIS</li>
	<li>Use the OpenStreetMap plugin to get roads, areas and points of interest from the surrounding area for reference (and for street data)</li>
	<li>Use <a>U.S. Geological Survey's Earth Exporer</a> to find heightmaps for the park area.</li>
	<li>Use the Clipper plugin to trim the heightmap data to the area of interest (this makes QGIS work faster since I don't have a bunch of data I don't care about)</li>
	<li>Use the Contour plugin to generate contour lines. I sometimes generate them ever 5 meters and every 25 meters. This lets me make the 25 meter ones a little bolder for easier reference.</li>
	<li>Create a new Vector (Lines) layer in which I refine the GPS tracks into discernible, named trails with blaze color information.</li>
</ol>
<div class="thumbnail"><a href="https://skitch.com/spilth/fkj89/skitch"><img src="https://img.skitch.com/20110717-n92xcdy87m1temx4i2pu28sygd.preview.jpg" alt="Skitch" /></a></div>
So far I've gotten my QGIS maps to look pretty close to the ones I've made in Illustrator.

<a title="woodlands-003 by spilth, on Flickr" href="http://www.flickr.com/photos/spilth/5947467648/"><img src="http://farm7.static.flickr.com/6128/5947467648_f614c60bde.jpg" alt="woodlands-003" width="500" height="386" /></a>

There's still plenty to figure out. Some of the things I still need to work on are:
<ul>
	<li>Figuring out how Map Units work in QGIS so I can</li>
<ul>
	<li>Generate things like trail length and a working Scale Bar</li>
	<li>Use symbols for Bridges that scale correctly with the size/zoom level of the map</li>
</ul>
	<li>Figure out how to turn heightmap data in meters into feet (assuming the map should use feet instead of meters)</li>
	<li>Master the vector editing tools.</li>
</ul>
