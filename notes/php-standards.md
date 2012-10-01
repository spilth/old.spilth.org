---
title: PHP Standards
layout: note
---

## Project Layout

- `src`
	- actual site code
	- deployed by AHP
- `scripts`
	- support scripts
	- run by cron or human on occasion
	- deployed by AHP
- `config`
	- environment and run-time settings
	- examples checked into source code
	- not deployed by AHP
	- managed by puppet
- `data`
  - working directory for application, not checked in
	- uploaded images, processed data, etc.
	- not deployed by AHP

## Configuration

- no `if ($env = "development")` branching
- set variables with environment-specific values a standards config file is created for each environment
	- same file name
	- same property names
	- different property values
	- managed by puppet
	- sample provided by developers
	- should be standardized across all projects
- php variable set in `httpd.conf`, `<virtualhost>`
  - `config_file = "/path/to/config/file.php"`
  - application then references `config_file` and loads configuration
  - should allow for easy local set up (also in `php.ini` or `httpd.conf`)
- [zend_config](http://framework.zend.com/manual/en/zend.config.html)?
	
## Version Control

Standard version control setup:

- `trunk`
- `branches`
- `tags`

## AHP Build Process

### Static Analysis

- [http://stackoverflow.com/questions/378959/is-there-a-static-code-analyzer-like-lint-for-php-files](http://stackoverflow.com/questions/378959/is-there-a-static-code-analyzer-like-lint-for-php-files)


## AHP Deploy Process

- rsync of `src` and `script` directory

## Disallowed Code

## PHP Configuration Variables (php.ini, etc.)

