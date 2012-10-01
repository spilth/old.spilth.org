---
title: PostgreSQL
layout: note
---

## Setup

I installed PostgreSQL from [PostgreSQL - KyngChaos Wiki](http://www.kyngchaos.com/software:postgres).

* PostgreSQL is installed at `/usr/local/pgsql`.
* PostgreSQL runs on port 5432

My Mac already had a `psql` binary in `/usr/bin`, which was generating the following error:

    psql: could not connect to server: Permission denied
    	Is the server running locally and accepting
	    connections on Unix domain socket "/var/pgsql_socket/.s.PGSQL.5432"?

In my `~/.bashrc_local` I have the following:

    export PGSQL_HOME=/usr/local/pgsql
    export PATH=$PGSQL_HOME/bin:$PATH

**NOTE: I had to restart my Mac before PostgreSQL would start up successfully.**

## pgAdmin 3

For a Admin GUI, install [pgAdmin](http://www.pgadmin.org/).

## Command-Line Tools

### Create a Database

    $ createdb database_name

### Drop a Database

    $ dropdb database_name

## psql

psql is the comman-line interface to PostgreSQL.

    $ psql mydb

For a full list of options:

    $ psql --help

### psql Cheatsheet

* `\q` = Quit psql
* `\h` = Help
* `\h SELECT` = Help on the SELECT command

## Views

Views give names to queries that you can view as a table.

To create a view:

    CREATE VIEW viewame AS
      SELECT foo
        FROM bar
        WHERE foo = "something";

## Resources

* [PostgreSQL](http://www.postgresql.org/)
* [pgAdmin](http://www.pgadmin.org/)

