# Awestruct

> [Awestruct](http://awestruct.org/) is a framework for creating static HTML sites.

## Requirements

* Ruby
* RubyGems

## Installation

	$ gem install awestruct
	
## Create a Project

	$ mkdir foo
	$ cd foo
	$ awestruct --init --framework blueprint

## Start Local Server

	$ awestruct -d
	
And then point your browser to `http://localhost:4242/`.

## Project Overview

* Site configuration data is stored in `_config`.
* Extensions are configured in `_ext`.
* Layouts are stored in `_layouts`.
* Stylesheets are stored in `stylesheets`.
* Images are stored in `images`.
* Pages can be stored in the root of the Awestruct project.

## Using Markdown

In the root of your project create a Markdown file such as `index.md`.

## Extensions

### Indexifier

	Awestruct::Extensions::Pipeline.new do
	  extension Awestruct::Extensions::Indexifier.new
	end
