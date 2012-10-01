## Install

gem install pry
gem install pry-doc

## Features

Customizations go in `~/.pryrc`.

	help
	gist -h

### Show Documentation
	
	s = "Hello"
	show-doc s.each_line
	show-doc String#each_line

### Show Method

	show-method String#each_line
	show-method String#each_line -l

### Generate GitHub Gist
	
	gist -m String#each_line


	require 'hello_world'
	ls HelloWorld
	HelloWorld.say_hello
	cd HelloWorld
		self
		ls -mj
		say_hello

		say_hello;
		hello world

	gem-cd hello_world
	/Users/bkelly1271/.rvm/gems/ruby-1.9.2-p290@global/gems/hello_world-0.0.2
	[18] pry(HelloWorld):1> .pwd
	/Users/bkelly1271/.rvm/gems/ruby-1.9.2-p290@global/gems/hello_world-0.0.2
	
	
	cd String
	nesting
	cd ..
	cd 0
	
	show-input
	!
	amend-line
	
## Debugging

## Rails

Edit `Gemfile`

	gem 'pry', :group => :development

Then run `bundle install`

Edit 'config/environments/development.rb'

	silence_warnings do
		require 'pry'
		IRB = Pry
	end
