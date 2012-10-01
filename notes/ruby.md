---
title: Ruby
layout: note
---

## The Basics

### Arrays

    foo = [42, "Arthur Dent", 6 * 9]
    puts foo[0]

### Hashes

    foo = {"answer" => 42}
    foo = {answer: 42} # Ruby 1.9 Syntax
    puts foo[:answer]

### Classes & Objects

    class Person
      def intialize(name, age)
        @name = name
        @age = age
      end

      def to_s
        "#{@name} is #{@age} years old."
      end
    end

    arthur = Person.new("Arthur Dent", 42)
    puts arthur

#### Extend A Class

    class Developer < Person
      def code
        puts "Tappity tap tap tap!"
      end
    end

    me = Developer.new("Brian", 36)
    me.code

### Requiring Files

Using `require` makes sure a file is loaded only once:

    # Require Ruby file from Ruby Load Path ($LOAD_PATH or $:)
    require 'csv'

    # Require Ruby File using explicit path
    require 'foo/bar/answer.rb'

    # Require Ruby file in same directory
    require_relative 'person'

### Modules

Create the file `foo.rb` with the following contents:

    module Foo
      def hello
        puts "Hello, world!"
      end
    end

Use the module in `program.rb` in same directory

    require_relative 'foo'

    # Call hello method defined in Foo module
    Foo:hello

Use Mixins to add module methods to a class

    require_relative 'foo.rb'

    class Bar
      include Foo
    end

    bar = Bar.new()
    bar.hello

## Essential Tools

### [Ruby Environment Manager](/notes/rvm)

* Manages and switches between multiple Ruby environments
* Automatically installs RubyGems?

### [RubyGems](/notes/rubygems)

RubyGems is a Package Manager for Ruby

### [Bundler](/notes/bundler)

Bundler is Dependency Manager for Ruby

## Resources 

* [Learn Ruby The Hard Way](http://ruby.learncodethehardway.org/book/)

