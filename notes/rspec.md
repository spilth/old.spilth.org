---
title: RSpec
layout: note
---

> RSpec is a Behaviour-Driven Development tool for Ruby programmers.

## Install

    gem install rspec

## Help

    rspec --help

## Basic Structure

* Example Groups are created using the `describe` method.
* Nested Groups are created inside an Example Group using additional `describe` methods or `context` methods.
* Examples are declared using the `it` or `specify` methods.

### Example Spec

    require './game'

    describe Game do
      describe "#score" do
        it "returns 0 for all gutter game" do
          game = Game.new
          20.times { game.roll(0) }
          game.score.should == 0
        end
      end
    end

### Example Implementation

    class Game
      def roll(pins)
      end

      def score
        0
      end
    end

## Run RSpec

By default, RSpec loads all files matching the pattern `spec/**/*_spec.rb`.

    $ rspec
    $ rspec game_spec.rb
    $ rspec game_spec.rb --color --format doc
    $ rspec game_spec.rb --format html --out results.html
    $ rspec game_spec.rb:5 # Run example on line 5

## Define Default RSpec Options for your Project

Create a file named `.rspec` in the root of your project and define options, one per line:

    --color
    --format documentation

## Rake Tasks

To add a spec tasks to your Rakefile:

    require 'rspec/core/rake_task'

    RSpec::Core::RakeTask.new(:spec)

    # Set spec as the default tasks
    task :default => :spec

### Run RSpec for Rails via Rake

    $ rake       # spec is the default task when using rspec-rails
    $ rake spec
    $ rake spec SPEC_OPTS="--format html --out results.html"

## Autotest

Add `.rspec` file in your project's root directory, then run `autotest`.

Or run `rspec --init`.

## Pending Examples

For behavior that has yet to be impemented, you can indicate this with empty examples or by using the `pending` method:

    describe "deep thought" do
      it "knows the answer to life, the universe and everything"
    end

    # or

    describe "deep thought" do
      it "knows the answer to life, the universe and everything" do
        pending("still determining actual question")
      end
    end

## Resources

* [RSpec Documentation](https://www.relishapp.com/rspec)

