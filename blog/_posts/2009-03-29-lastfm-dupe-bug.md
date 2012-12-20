--- 
layout: post
title: last.fm Dupe Bug?
tags: 
- Music
- Programming

---
Hi last.fm,

I really like your site and the services it offers. I really love music and appreciate finding people with similar tastes, reading up on bands I like, expanding my own library by finding other bands through your site and just letting people know what I've been listening to.

But lately I've been experiencing a bug that's been annoying the hell out of me: after scrobbling my latest songs I check <a href="http://www.last.fm/user/spilth/tracks">my Recently Listened Tracks</a> and find songs show up twice or more when I know I only listened to that song once at that time.

I thought maybe the problem was with the scrobbler so I updated to the latest version and took some screenshots of what it was doing.  It showed each song only once so all looked well there.
<p style="text-align:center;"><a title="last.fm's Scrobbler's Opinion of my plays  by spilth, on Flickr" href="http://www.flickr.com/photos/spilth/3397731522/"><img class="aligncenter" src="http://farm4.static.flickr.com/3540/3397731522_565d4d67d7_m.jpg" alt="last.fm's Scrobbler's Opinion of my plays " width="240" height="169" /></a></p>

When I checked my recent tracks on the web site I saw duplicate entries for a number of bands.
<p style="text-align:center;"><a title="last.fm's web site's opinion of what I played by spilth, on Flickr" href="http://www.flickr.com/photos/spilth/3397737476/"><img class="aligncenter" src="http://farm4.static.flickr.com/3624/3397737476_09fc03d608_m.jpg" alt="last.fm's web site's opinion of what I played" width="240" height="110" /></a></p>

The biggest culprit seems to be <a href="http://www.last.fm/music/Hammock">Hammock</a>. I've seen their tracks show up over 20 times on my playlist at the same exact minute.
<p style="text-align:center;"><a title="Over 20 times in a minute? I don't think so... by spilth, on Flickr" href="http://www.flickr.com/photos/spilth/3396999823/"><img class="aligncenter" src="http://farm4.static.flickr.com/3611/3396999823_7683f3b967_m.jpg" alt="Over 20 times in a minute? I don't think so..." width="240" height="178" /></a></p>

The only thing I can offer about Hammock is that I fall asleep to them most every night, but definitely not on infinite loop. But this problem also happens with other bands, so I don't think it's Hammock specific.

So my questions for you are?

<strong>Are these songs showing up twice in the database table (or whatever) for my "song plays"?</strong>

When I try to delete one of the dupes, both/all entries end up getting deleted.  I don't see this until I refresh the page though. From poking around your code I see the following:
<ul>
	<li>The HTML for the dupes show the same exact JavaScript code for deleting the dupe tracks: rmrecenttrack(this, 21617457, 1238250572)</li>
	<li>The rmrecentrack method is defined as such: rmrecenttrack(link, trackid, listendate)</li>
</ul>
So both the trackid and listendate are the same. That explains why they both end up getting deleted - they are in fact the same entry. But if they have the same exact listendate... why are they showing up multiple times?

My only guess is that you have duplicate entries in your database, or whatever is feeding your view code is generating duplicate entries. I wonder where this is coming from if the scrobbler is showing a single entry for these songs. I'd love to help you figure this out.

<strong>Are these dupe entries also counting as duplicate plays towards the play count for that song/artist?</strong>

This is the only answer I really care about. I don't want these dupe entries messing up my play counts, especially when a song can be duped up to 20 times. I suppose I could do some more digging on this but I've already spent an hour looking into this. It seems to be happening to others as I've found<a href="http://www.last.fm/forum/search?q=duplicates&amp;forums=21713"> other people complaining about duplicate entries in the last.fm forums</a>.

I know I don't pay for your service (I'm sure you're doing alright on ads, yea?) but would appreicate knowing if you're aware of the problem and if you have figured out the cause and know how to fix.
