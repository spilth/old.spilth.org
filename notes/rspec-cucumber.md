# RSpec and Cucumber

* Object Behavior = RSpec
* Application Behavior = Cucumber

## RSpec Installation

	$ gem install rspec --version 2.0.0	
	$ rspec --help

## Hello RSpec

Edit `greeter_spec.rb`

	# Describe Example Group
	describe "RSpec Greeter" do

		# Describe Example
		it "should say 'Hello RSpec!' when it recieves the greet() message" do
		    # Given
			greeter = RSpecGreeter.new

		    # When
			greeting = greeter.greet

		    # Then
			greeting.should == "Hello RSpec!"
		end
	end

The run RSpec:

	rspec greeter_spec.rb
	
Define class in `greeter_spec.rb` (for now...)

	class RSpecGreeter
		def greet
			"Hello RSpec!"
		end
	end

Run RSpec again:

	rspec greeter_spec.rb

## Install Cucumber

	$ gem install cucumber --version 0.9.2
	$ cucumber --help

## Hello Cucumber

Edit `features/greeter_says_hello.feature`:

	Feature: greeter says hello
		
		In order to start learning RSpec and Cucumber
		As a reader of The RSpec Book
		I want a greeter to say Hello
		
		Scenario: greeter says hello
			Given a greeter
			When I send it the greet message
			Then I should see "Hello Cucumber!"

And run Cucumber:

	$ cucumber features

## Cucumber

Cucumber features have 3 parts:

* Title
* Brief Narrative
* Scenarios (Acceptance Criteria)

### Scenario Steps

* Given - represents the state of the world before an event.
* When - represents the event
* Then - represents the expected outcome
* And 
* But

### Scenario Outline

Helps DRY up your Scenarios by iterating over several scenarios.

### Step Defintions

## RSpec

rspec spec/codebreaker/game_spec.rb --format doc

