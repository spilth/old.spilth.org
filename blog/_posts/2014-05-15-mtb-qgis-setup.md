---
title: Mountain Biking Trail Maps with QGIS - Setup
layout: post
---

I've been working on [a book about creating trail maps](https://leanpub.com/mtb-qgis) on and off for the past year but it's been a bit slow going. Some things require a lot of research or just a lot of details. That starts to feel a bit overwhelming and the idea struck me to just start breaking it up into blog posts and then eventually publish all those posts as a book. This lets me get feedback and questions from people much faster, as well as not make the project so daunting.

So for the first installment we'll be installing the two main tools you'll want to use - QGIS and GPSBabel.

## QGIS

The main application you need to install is QGIS. You can [download it from the QGIS web site](http://www.qgis.org/en/site/forusers/download.html). Since QGIS is constantly being updated and the installation instructions are on the site, I will not be reproducing them here.

### QGIS Plugins

Once you have QGIS installed you'll want to install a few of its plugins to extend it's capabilities. To install a plugin:

1. Start QGIS.
1. Click on the `Plugins` menu, then `Manage and Install Plugins...`.
1. Click on the `All` label on the left.
1. In the Search box type `OpenLayers`.
1. Click on the `OpenLayers Plugin` entry that shows up.
1. Click on the `Install plugin` button in the lower right.
1. Click on the `Installed` label on the left.
1. Make sure `OpenLayers Plugin` is checked so that it is enabled.

Repeat the above steps for the following plugins:

- `OpenLayers Plugin` - This plugin let's us pull in reference maps from OpenStreetMap, Google, Yahoo, Bing and a few others.
- `Contour plugin` - This plugin is essential for creating contour lines to show elevation.
- `Table Manager` - This plugin is handy when editing information about trails.

{% image mtb-qgis-qgis-plugin-manager.png %}

Finally, click `Close` when you are done.

## GPS Babel

[GPSBabel](http://www.gpsbabel.org/) is a fantastic little tool that makes it easy to:

- Download data from your GPS.
- Convert GPS data from one format to another.
- Merge GPS data from multiple files into one file.

{% image mtb-qgis-gpsbabel.png %}

Next time we'll get started on creating our map and generating a rough draft with our GPS tracks. So get out and ride and collect some trail data of your favorite park with your GPS!

