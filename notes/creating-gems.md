---
title: Creating & Releasing Ruby Gems
layout: note
---

## Manual Project Setup

    $ mkdir ubyray
    $ cd ubyray
    $ mkdir lib
    $ mkdir lib/ubyray
    $ touch lib/ubyray.rb
    $ vim ubyray.gemspec

`ubyray.gemspec`

    Gem::Specification.new do |gem|
      gem.name = 'ubyray'
      gem.version = '0.0.1'
      gem.summary = 'The Stars!'
      gem.authors = ['Brian Kelly']
    end

## Build Your Gem

    $ gem build ubyray.gemsepc

This creates `ubyray-0.0.1.gem`.

## Install Your Gem Locally

    $ gem install ubyray-0.0.1.gem

## Adding Functionality to your Gem

    $ vim lib/ubyray.rb

`lib/ubyray.rb`

    module Ubyray
      ...
    end


    $ vim startdust.gemsepc

`ubyray.gemspec`

    gem.files = ['lib/ubyray.rb']
    gem.require_paths = ['lib'] # lib is the default though

### Using Flexible Version Numbering

    $ vim lib/ubyray/version.rb

`lib/stardst/version.rb`

    module Ubyray
      VERSION = '0.0.1'
    end

    $ vim lib/ubyray.rb

`lib/ubyray.rb`

    require 'ubyray/version'

    module Ubyray
      ...
    end

    $ vim ubyray.gemspec

`ubyray.gemspec`

    require './lib/ubyray/verson'
    
    Gem::Specification.new do |gem|
      ...
      gem.version = ubyray::VERSION
      gem.files = ['lib/ubyray.rb', 'lib/ubyray/version.rb']
      # or #
      gem.files = Dir['lib/**/*.rb']
      ...
    end

## Build and Publih your gem to RubyGems.org

    $ gem build ubyray.gemspec
    $ gem push ubyray-0.0.1.gem

## Adding Dependencies

    $ vim ubyray.gemspec

`ubyray.gemspec`

    # Runtime Dependency
    gem.add_dependency 'activesupport', '~> 3.0'

    # Development Dependency
    gem.add_development_dependency 'rspec', '~> 2.0'


## Bundler for Gem Development

    $ bundle init
    $ vim Gemfile

`Gemfile`

    source "http://rubygems.org"
    
    gemspec
    
    $ bundle
    $ bundle gem ubyray # Create a Gemfile, Rakefile and init's a git repo

    rake build   # Same as gem build ubyray.gemspec
    rake install # Build and then install gems
    rake release # Creates git tag for current version number and push to rubygems.org

    git remote add origin git@github.com:username/ubyray.git

## Testing with RSpec

### RSpec

    gem.add_development_dependency 'rspec'
    
    $ mkdir spec
    $ vim spec/spec_helper.rb

    # Add lib to the loadpath
    $:.unshift(File.expand_path('..'..'lib', __FILE__))

    require 'rspec'
    require 'ubyray'
    
    $ vim spec/ubyray_spec.rb
    
    require 'spec_helper'
    
    describe ubyray do
      specify { ubyray.should be_a(Module) }
    end
    
    $ rspec
	
## Resources

- [RubyGems.org](https://rubygems.org/)
- [RubyGems Guides](http://guides.rubygems.org/)
- [Gem Specification Reference](http://guides.rubygems.org/specification-reference/)
- [bundler Gem](http://gembundler.com/)
- [gemcutter Gem](https://rubygems.org/gems/gemcutter)
- [geminabox Gem](http://tomlea.co.uk/posts/gem-in-a-box/)
- [Gem Creation with Bundler](http://net.tutsplus.com/tutorials/ruby/gem-creation-with-bundler/)
- [Code TV - Creating Ruby Gems](http://www.codeschool.com/code_tv/creating-ruby-gems)

