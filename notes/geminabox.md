---
title: geminabox
layout: note
---

## Setup

	$ gem install geminabox
	$ mkdir geminabox
	$ cd geminabox
	$ mkdir data
	$ vim config.ru
	
	require "rubygems"
	require "geminabox"

	Geminabox.data = "./data"
	run Geminabox
	
	$ rackup

Visit http://localhost:9292/
	
## Push Gems to your Server

	$ gem install geminabox
	$ gem build secretgem.gemspec
	$ gem inabox secretgem-0.0.1.gem
	Host http://localhost:9292

## Tell RubyGems about your Gem Server

	$ gem sources --add http://localhost:9292	

## Tell Bundler about your Gem Server

	$ vi Gemfile
	
	source "http://localhost:9292"
	gem "secretgem"
	
	$ bundle

## Resources

- http://guides.rubygems.org/run-your-own-gem-server/
