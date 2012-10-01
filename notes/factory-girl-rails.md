---
title: Factory Girl for Rails
layout: note
---

## Add Gem to your Rails App

Edit your `Gemfile`

	group :test do
		gem 'factory_girl_rails'
	end

## Create Factories

Create the file `test/factories.rb` and use `FactoryGirl.define` to define factories:

	FactoryGirl.define do
	  factory :user do
	    username "adent"
		password "fortytwo"
		email { "#{username}@h2g2.com" }
	  end
	end

## Use your Factories in your Tests

	FactoryGirl.create(:user)
	FactoryGirl.create(:user, username: "trillian", password: "random")
	
## Test Helper

In `test/test_helper.rb` put the following:

	class ActiveSupport::TestCase
	  include Factory::Syntax::Methods
	end

Then in your tests you can remove the `FactoryGirl.` part of your factory calls:
	
	create(:user)
	build(:user)
	
## Use Sequence in your Factories

	FactoryGirl.define do
	  factory :user do
		sequence(:username) { |n| "foo#{n}"}
		password "bar"
	  end
	end

## Set Up Associations

	factory :article do
		name "Foo"
		user # References user factory
	end
	
## Tips

### Avoid Saving When Possible

Prefer `build(:user)` over `create(:user)` if you don't need a record in the database.

### Avoid factory_girl when possible

If you're not setting any attributes, fall back to using just `Model.new`, instead of `create(:model)`.

## Resources

* [Factories Not Fixtures (Revised)](http://railscasts.com/episodes/158-factories-not-fixtures-revised)
