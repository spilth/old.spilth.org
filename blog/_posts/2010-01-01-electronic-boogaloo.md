--- 
layout: post
title: Electronic Boogaloo
tags: 
- Electronics
- Geekdom
- Programming

---
I've always had a passing interest in electronics but the most electronic work I've ever really done was fixing the cracked solder of an input of a multitrack recorder I had when I was in high school. Other than when I used to build my own computers, I haven't done much else.

Recently my friend Kim suggested we "do a project together" after talking about things like <a href="http://makezine.com/">Make magazine</a> and <a href="http://www.arduino.cc/">Arduino boards</a>. We haven't picked a project yet but we've started investing in learning about electronics in order to obtain the skills we need to build something.

I ended up ordering 3 books:
<ul>
	<li><a href="http://www.makershed.com/ProductDetails.asp?ProductCode=9780596153748&amp;Click=37845">Make: Electronics</a></li>
	<li><a href="http://oreilly.com/catalog/9780596154141/">Programming Interactivity</a></li>
	<li><a href="http://oreilly.com/catalog/9780596154141/"></a><a href="http://www.makershed.com/ProductDetails.asp?ProductCode=9780596155513">Getting Started with Arduino</a></li>
</ul>
<ul></ul>
<strong>Make: Electronics</strong>

In order to do the experiments in Chapter 1 of Make: Electronics I went to a store I haven't voluntarily been to in years - <a href="http://www.radioshack.com/">Radio Shack</a>. It was exciting to see all the various kinds of eletrical components and tools that I could potentially be playing with:
<p style="text-align:center;"><a title="Exciting Drawers by spilth, on Flickr" href="http://www.flickr.com/photos/spilth/4235061088/"><img class="aligncenter" src="http://farm3.static.flickr.com/2801/4235061088_8fdc3df3ca_m.jpg" alt="Exciting Drawers" width="240" height="180" /></a></p>
I ended up getting the majority of what I needed but the selection at the two Radio Shacks I went to were a little bit slim. I ordered what I was missing and much of the Chapter 2 items from the Radio Shack site instead.  The Saturday night after X-mas I started trying out the experiments in the book. My Saturday nights are not normally this wild and crazy:
<p style="text-align:center;"><a title="Wild Saturday Night by spilth, on Flickr" href="http://www.flickr.com/photos/spilth/4216988523/"><img class="aligncenter" src="http://farm3.static.flickr.com/2789/4216988523_9ba4f42916_m.jpg" alt="Wild Saturday Night" width="240" height="180" /></a></p>
Today I re-created the above using the breadboard I got in my order. It's definitely a lot easier than getting those little alligator clips to grab onto little wires:
<p style="text-align:center;"><a title="Breadboard LED by spilth, on Flickr" href="http://www.flickr.com/photos/spilth/4234844548/"><img class="aligncenter" src="http://farm3.static.flickr.com/2718/4234844548_f8eec7a910_m.jpg" alt="Breadboard LED" width="180" height="240" /></a></p>
I'm still learning and confused by a number of things, but hopefully more experimentation will bring things to light.

<strong>Programming Interactivity</strong>

I also started reading and skimming through Programming Interactivity which led me to <a href="http://processing.org/">the interactive multimedia language and environment called Processing</a>. I soon realized that this language could possibly be used to implement another project I've been working on.

Continuous Integration is the practice of automatically compiling and testing code every time it changes. A Build Monitor presents the results of the compiling and testing, most simply with a Success or Failure message. These are often used as an <a href="http://www.agileadvice.com/archives/2005/05/information_rad.html">information radiator</a>, a way to casually inform people of the status of something. I've been wanting to build one to display the status of projects we're running continuous integration builds with <a href="http://www.anthillpro.com/html/default.html">AntHill Pro</a> at work. I'd like it to be generic enough to use with other CI tools like <a href="http://hudson-ci.org/">Hudson</a> or <a href="http://cruisecontrol.sourceforge.net/">CruiseControl</a>.

I have a version I've been working on using Quartz Composer for the Mac:
<p style="text-align:center;"><a title="Geeking Out by spilth, on Flickr" href="http://www.flickr.com/photos/spilth/4099484320/"><img class="aligncenter" src="http://farm3.static.flickr.com/2549/4099484320_620184cd7d_m.jpg" alt="Geeking Out" width="240" height="180" /></a></p>
But I realize it would be good to have a cross-platform solution that anybody could use. Thus I started putting together a version in Processing:
<p style="text-align:center;"><a title="Processing Build Monitor by spilth, on Flickr" href="http://www.flickr.com/photos/spilth/4225885690/"><img class="aligncenter" src="http://farm5.static.flickr.com/4057/4225885690_436b700585_m.jpg" alt="Processing Build Monitor" width="240" height="192" /></a></p>
I finally also made the project publicly available by putting it up on GitHub: <a href="http://github.com/spilth/ci-build-monitor">http://github.com/spilth/ci-build-monitor</a>

<strong>Getting Started with Arduino</strong>

I flipped through this book a little bit but since I don't have an Arduino yet, I can't do too much with it. I want to make some progress with Make: Electronics before trying out any Arduino projects, if only to arm myself with knowledge so I don't burn out the Arduino board.
