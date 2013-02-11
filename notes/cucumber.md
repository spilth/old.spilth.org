---
title: Cucumber
layout: note
---

> BDD that talks to domain experts first and code second 

[http://cukes.info/](http://cukes.info/)

## Installation

Edit your project's `Gemfile` and add:

    gem 'guard-cucumber'

Then install by running `bundle`.

## Getting Started

Start by running `cucumber` which will generate some basic info:

    $ cucumber
    You don't have a 'features' directory.  Please create one to get started.
    See http://cukes.info/ for more information.

So create a `features` directory and try running `cucumber` again:

    $ mkdir features
    $ cucumber
    0 scenarios
    0 steps
    0m0.000s

### Describe a Feature with Scenarios and Steps

Create the file `features/adding.feature` with the following contents:

{% highlight cucumber %}
Feature: Adding
  Scenario: Add two numbers
    Given the input "2+2"
    When the calculator is run
    Then the output should be "4"
{% endhighlight %}

Then run `cucumber` again:

    $ cucumber
    Feature: Adding

      Scenario: Add two numbers       # features/adding.feature:3
        Given the input "2+2"         # features/adding.feature:4
        When the calculator is run    # features/adding.feature:5
        Then the output should be "4" # features/adding.feature:6

    1 scenario (1 undefined)
    3 steps (3 undefined)
    0m0.002s

    You can implement step definitions for undefined steps with these snippets:

    Given /^the input "(.*?)"$/ do |arg1|
      pending # express the regexp above with the code you wish you had
    end

    When /^the calculator is run$/ do
      pending # express the regexp above with the code you wish you had
    end

    Then /^the output should be "(.*?)"$/ do |arg1|
      pending # express the regexp above with the code you wish you had
    end

    If you want snippets in a different programming language,
    just make sure a file with the appropriate file extension
    exists where cucumber looks for step definitions.

### Define Steps

Create a `step_definitions` directory under `features`:

    $ mkdir features/step_definitions

Now define the steps using the provided snippets above in a new file `features/step_definitions/calculator_steps.rb`:

    TK

## Integrating with Guard

Edit your `Gemfile` and add the following:

    gem 'guard-cucumber'

Then initialize a `Guardfile` using the following:

    $ bundle exec guard init cucumber

Which will generate something like this:

{% highlight ruby %}
guard 'cucumber' do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})          { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end
{% endhighlight %}

