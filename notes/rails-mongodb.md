---
title: MongoDB
layout: default
---

## Installation

	$ brew install mongodb

	==> Caveats
	If this is your first install, automatically load on login with:
	    mkdir -p ~/Library/LaunchAgents
	    cp /usr/local/Cellar/mongodb/2.0.7-x86_64/homebrew.mxcl.mongodb.plist ~/Library/LaunchAgents/
	    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

	If this is an upgrade and you already have the homebrew.mxcl.mongodb.plist loaded:
	    launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
	    cp /usr/local/Cellar/mongodb/2.0.7-x86_64/homebrew.mxcl.mongodb.plist ~/Library/LaunchAgents/
	    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

	Or start it manually:
	    mongod run --config /usr/local/etc/mongod.conf

	The launchctl plist above expects the config file to be at /usr/local/etc/mongod.conf.
	==> Summary
	/usr/local/Cellar/mongodb/2.0.7-x86_64: 17 files, 118M, built in 5.8 minutes

	$ 

## Start MongoDB

	$ mongod run --config /usr/local/etc/mongod.conf

Visit http://localhost:28017/

## Rails Project using MongoDB

	$ rails new gkb --skip-active-record

Edit `Gemfile` and add:

	gem 'mongoid', '~> 3.0.2'

Then run

	$ bundle
	$ rails g mongoid:config
	$ rails server
	
### Create a Model

Run

	$ rails g scaffold product name price:big_decimal

Then edit `app/models/product.rb` and add:

	class Product
	  include Mongoid::Document
	  field :name, type: String
	  field :price, type: BigDecimal
	end

  Product.where(:price.lte => 40).first
  Product.lte(price: 40)

  Mongoid::Criteria

  Product.lte(price: 40).gt(...)

  rails g model review content

  class Product
    ...

    embeds_many :reviews
  end

  class Review
    include Mongoid::Document
    field :content, type: String

    embedded_in :product
  end

  p = Product.first
  p.reviews.create! content: "great game!"

Embedded association stores the document within another document

  Review.count returns 0

Embedding prevents having to do extra queries

Mongoid::Timestamps = created_at / updated_at
Mongoid::Paranoia
	p.restore

Mongoid::Versioning

## Identifier String

  field :_id, type: string, default: ->{ name.to_s.parameterize }

Add validation for uniqueness

## Resources

- http://www.mongodb.org/
- http://mongoid.org/
- http://mongoid.org/en/origin/
- http://mongohub.todayclose.com/
