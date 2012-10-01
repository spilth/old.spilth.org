
## Add mysql JAR to Tomcat

Copy mysql-connector-java-3.1.14-bin.jar to tomcat-6/lib

## Edit tomcat/conf/server.xml

	<Resource name="jdbc/cmdb"
		auth="Container"
		type="javax.sql.DataSource"
		username="root"
		password=""
		driverClassName="com.mysql.jdbc.Driver"
		description="CMDB Database"
		url="jdbc:mysql://localhost:3306/cmdb_production"
		maxActive="15"
		maxIdle="3"/>

## Install JRuby and Bundler
	
	rvm install jruby
	rvm use jruby
	gem install bundler
	bundle install

## Edit Gemfile

	source 'http://rubygems.org'

	gem 'rails', '3.0.10'
	gem 'ancestry'
	gem 'warble'

	group :development do
	  gem "rails-erd"

	  platforms :ruby do
	    gem 'mysql2', '~> 0.2.11'
	  end

	end

	platforms :jruby do
	        gem 'activerecord-jdbcmysql-adapter'
	end
	
## Edit conf/warble.rb


	config.webxml.jruby.min.runtimes = 2
	config.webxml.jruby.max.runtimes = 4
	config.webxml.jndi = 'jdbc/cmdb'

## Questions

* How are migrations handled?
