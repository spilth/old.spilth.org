# Grails

## Installation

* Unzip `grails-1.3.7.zip`
* Move to `Applications` folder
* Edit `~/.profile`
* Run `source ~/.profile` or start new Terminal session to set new `PATH` variable.
* Run `grail` and confirm help message.

### Example `.profile`

	export GRAILS_HOME=/Users/brian/Applications/grails-1.3.7
	export PATH=$GRAILS_HOME/bin:$PATH

## Create an Application

To create a Grails application, use the `create-app` target of the `grails` command.

	$ grails create-app foo
	...
	Created Grails Application at /Users/brian/Dropbox/Projects/Grails/foo
	
## Run your Grails Application

To run your Grails application use the `run-app` target of the `grails` command. 

	$ cd foo
	$ grails run-app
	...
	Running Grails application..
	Server running. Browse to http://localhost:8080/foo

Your application should now be available at `http://localhost:8080/foo`.

## Get List of Grails Targets

	$ grails help
	...
	Usage (optionals marked with *):
	grails [environment]* [target] [arguments]*

	Examples:
	grails dev run-app
	grails create-app books

	Available Targets (type grails help 'target-name' for more info):
	grails add-proxy
	grails bootstrap
	grails bug-report
	grails clean
	...

## Grails Application Directory Structure

The directory structure of a Grails app is as follows:

* application.properties
* grails-app
  * conf
  * controllers
  * domain
  * i18n
  * services
  * taglib
  * utils
  * views
    * layouts
* lib
* scripts
* src
  * groovy
  * java
* target
* test
  * integration
  * unit
* web-app
  * css
  * images
  * js
  * META-INF
  * WEB-INF
