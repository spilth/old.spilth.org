---
title: Rails Testing
layout: note
---

## Test::Unit

Out of the box, Rails uses Test::Unit for testing.  

### Test Directory Layout

Tests go in the `test` directory.

* `test`
  * `fixtures` - fixture files for models using YAML
  * `functional` - tests for Controllers, extending `ActionController::TestCase`
    * `projects_controller_test.rb` - defines `ProjectsControllerTest`
    * `integration`
  * `performance`
  * `unit` - tests for Models, extending `ActiveSupport::TestCase`
    * `helpers`
    * `project_test.rb` - defines `ProjectTest`
  * `test_helper.rb` - injects additional methods into ActiveSupport::TestCase. Good place for common setup and assertion methods needed by all tests.


### Test Classes

Your tests will be subclasses of Test::Unit::TestCase, specifically ActiveSupport::TestCase for Models and ActionController::TestCase for Controllers.

Tests are defined using the `test` method.

    class PersonTest < ActiveSuport::TestCase
      test "Knows the answer to everything" do
        @adent = Person.new("Arthur Dent")
        assert_equal 42, @adent.answer
      end
    end

#### Test Setup & Teardown

If you have objects that need to be set up before and/or torn down after each test, you can use the `setup` and `teardown` methods to manage those objects.

    # Classic Form
    
    def setup
      # Set up common objects used across multiple tests
    end
	
    # Block Declaration Form
	
    setup :create_fred
    teardown :reset_globals
	
    def create_fred
      # ...
    end

    def reset_globals
      # ...
    end

## Rake Tasks for Testing
  
    rake test
    rake test:units
    rake test:functionals
    rake test:integration
    rake test:recent    
    rake test:single   
    rake test:uncommitted

## Fixtures

Fixtures are stored in the `test/fixtures` directory and use the YAML format.

It's important to note that:

* Fixture data is converted to a database record directly, without going through ActiveRecord creation methods
* Fixture loading also bypasses validations
* Fixture files are interpreted as ERb files, which allows for dynamic attributes

Fixtures use the following YAML format:
	
	identifier:
		attribute_name: attribute_value
		attribute_name: attribute_value
    ...

	arthur:
		first_name: Arthur
		last_name: Dent
		favorite_number: <%= 6 * 7 %>
		
Records can be accessed in your tests using their identifier:

	person(:arthur)

