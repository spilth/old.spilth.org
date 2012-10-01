---
title: PostGIS
layout: note
---

## Installation

I installed PostgreSQL and PostGIS from [PostgreSQL - KyngChaos Wiki](http://www.kyngchaos.com/software:postgres).

See [my notes on PostgreSQL](/notes/postgresql).

* The PostGIS SQL files are installed at `/usr/local/pgsql/share/contrib/postgis-1.5`.

## Creatre a PostGIS Database

To create a PostGIS database, execute the following commands:

    $ createdb trails
    $ createlang plpgsql trails
    $ psql -d trails -f /usr/local/pgsql/share/contrib/postgis-1.5/postgis.sql
    $ psql -d trails -f /usr/local/pgsql/share/contrib/postgis-1.5/spatial_ref_sys.sql

### Create a Table with a Geometry Column

    CREATE TABLE gps_points (
      id SERIAL PRIMARY KEY,
      point GEOMETRY NOT NULL,
      db_time TIMESTAMP DEFAULT now(),
      gps_time TIMESTAMP NOT NULL,
      track_id INTEGER NOT NULL
    );

## Import a Shapefile

    $ shp2pgsql trails.shp trails > trails.sql
    $ psql -d gis -f trails.sql 

## Resources

* [PostGIS](http://postgis.refractions.net/)
* [PostGIS Quickstart](http://live.osgeo.org/en/quickstart/postgis_quickstart.html)

