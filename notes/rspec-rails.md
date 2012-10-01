---
title: RSpec Rails
layout: note
---

## Installation

Edit your `Gemfile`:

    group :test, :development do
      gem 'rspec-rails'
    end

RSpec needs to be in your development environment so Rails generators can make use of it while you're developing.

Run `bundle install` to install RSpec.

Then generate RSpec skeleton directories/files:

    rails generate rspec:install

Which generates the following files/directories:

* `.rpsec` - run options for RSpec
* `spec` - where you'll put your spec files
  * `spec_helper.rb` - RSpec equivablent of Test::Unit's `test_helper.rb`

It also:

* Updates Rakefile to run RSpec as the default task
* Ensures future generators create RSpec tests

As you use RSpec and Rails generators, the following directories will be created under the 'spec' directory:

* `controllers`
* `helpers`
* `models`
* `request`
* `routing`
* `views`

## Basic Example

    describe User do
      it "should have initials" do
        mock_user = mock_model(User, :first => "Arthur", :last => "Dent")
        mock_user.initials.should == "AD"
      end
    end

## Methods

* `describe` (aliased as `context`) - groups specifications together
* `it` (aliased as `specify`) - defines individual specifications
* `should` and `should_not` - matches expectations
* `mock`

### Unimplemented Specifications

If a particular specification hasn't been implemented, it can be marked in two different ways:

    it "hasn't been implemented yet"

    it "hasn't been implemented yet" do
      pending "not implemented yet"
      answer.should eq(42)
    end

### Setup & Teardown

    before :each
    before :all
    after :each
    after :all

## Syntax: Test::Unit vs. RSpec 

    # Test::Unit
    assert_equal(expected, actual)

    # RSpec
    actual.should == expected

## Predefined Matchers

    be_true
    be_false
    be_close(target, threshold)
    change(object, :attribute) { block }
    eql(value)
    match(regex)
    raise_error(error)
    satisfy { block }

## Dynamic Matches

    be_nil
    be_a_kind_of(String)
    have_at_least
    have_at_most

