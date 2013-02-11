---
title: Automated VM Generation with veewee, Vagrant, Jenkins and Amazon S3 - Part 1 
layout: post
---

Recently at my job there has been an increasing amount of LAMP development going on. One part of the learning curve is getting developers set up with an LAMP environment to develop on. Currently this is done by developers using a shared environment. I wanted to explore the idea of developers being able to easily spin up a local LAMP environment using Vagrant and Puppet.

There are a large number of [Vagrant base boxes](http://www.vagrantbox.es/) available but people (like your boss) probably shy away from the idea of using a base box built by somebody else. Who knows what could be on it without doing some kind of audit?  Luckily there is a tool called [veewee](https://github.com/jedi4ever/veewee) that helps automate the process of building your own base boxes.

I thought it would be fun to try and automate the whole process using [Jenkins](http://jenkins-ci.org/) and publish the box to Amazon S3.
Later I'll create a Vagrant project and reference the base box I created using vewee and work towards turning it into a LAMP box.

I'll be using the following tools:

- [RVM](https://rvm.io/) - Used to install and manage our Ruby environment.
- [Ruby](http://www.ruby-lang.org/) - veewee and Vagrant are Ruby projects.
- [RubyGems](http://rubygems.org/) - veewee and Vagrant are provided as Ruby Gems.
- [Bundler](http://gembundler.com/) - Used to define and resolve the Ruby Gems used by our project.
- [VirtualBox](https://www.virtualbox.org/) - veewee and Vagrant use VirtualBox to build and run Virtual Machines.
- [veewee](https://github.com/jedi4ever/veewee) - The tool we use to build our own custom box.
- [Vagrant](http://www.vagrantup.com/) - The tool we use to configure and run our Virtual Machines.
- [CentOS](http://www.centos.org/) - A free Linux distribution equivalent to RedHat.
- [Puppet](http://puppetlabs.com/) - The tool will be using to automatically provision the VM - install packages and setup service.
- [GitHub](https://github.com/) - Where we'll store out project code.
- [Jenkins](http://jenkins-ci.org/) - A Continuous Integration server we'll use to automate the building of our box.
- [Amazon S3](http://aws.amazon.com/s3/) - Used as a public place to host our base box.

### Assumptions

I'm assuming the following about you:

- you're familiar with Ruby
- you're familiar with Unix/Linux
- you know how to use Git fairly well
- you know how to set up an Amazon S3 Bucket

If you don't know any of those things then Google is your best friend.

## Prepare Host Machine

I'm doing this on my Mac so there were a few things I needed to set up before getting started.

### VirtualBox

Vagrant uses VirtualBox so I installed that first. You can download it from <https://www.virtualbox.org/wiki/Downloads>.

### Ruby

veewee and Vagrant are both Ruby Gems so you'll need to have Ruby and RubyGems installed. My recommended way of doing this is to use [RVM](https://rvm.io/).

#### Install Ruby 1.9.3

Once you have RVM installed you can install Ruby 1.9.3.

    $ rvm install 1.9.3

Then switch to Ruby 1.9.3

    $ rvm use 1.9.3

## veewee Project

We're going to make a veewee project that defines and builds the CentOS base box we want to use in Vagrant. Let's start by making a directory for our veewee project:

    $ mkdir veewee-centos63
    $ cd veewee-centos63

### Define Gem Dependencies

Since we're using veewee and Vagrant, we need to install those Gems for our project to work. The best way to do this is using a [Gemfile](http://gembundler.com/gemfile.html) which lists the version of each Gem we want to use. So create a `Gemfile` in your project's directory with the following contents:

    source :rubygems

    gem 'vagrant', '1.0.5'
    gem 'veewee', '0.3.7'

Then to install the gems simple run:

    $ bundle

### Create Base Box Definition

Now we create the definition files required for making a base box using veewee:

    $ bundle exec veewee vbox define 'centos63' 'CentOS-6.3-x86_64-minimal'

This will create a number of files in a `definitions` folder. You can tweak these to your liking but I'm leaving them as is for now.

FYI: The `bundle exec` makes sure we're using the version of veewee defined in our Gemfile.

If you're curious, you can see a full list of available templates by running:

    $ bundle exec veewee vbox templates
    
### Build Base Box

Now it's time to actually build, validate and export the base box:

    $ bundle exec veewee vbox build 'centos63'
    $ bundle exec veewee vbox validate 'centos63'
    $ bundle exec vagrant basebox export 'centos63'

This will create a file named `centos63.box` in your `veewee-centos63` directory.
	
To immediately add the box to the host machine's Vagrant boxes:

    $ vagrant box add 'centos63' 'centos63.box'

If the box already exists you'll need to first run the following:

	$ bundle exec vagrant box remove 'centos63'

Later on we'll be pushing this box to Amazon S3 and referencing it from a Vagrant project to get it installed.

### Automating the Build

Since we'll be building this box using a CI server, we want to automate the process as much as possible, so let's write a little script called `build.sh` to run the above for us:

    #!/bin/bash

    bundle install

    bundle exec veewee vbox build 'centos63' --force --auto --nogui
    bundle exec veewee vbox validate 'centos63'

    bundle exec vagrant basebox export 'centos63' --force

Make sure you allow executable permissions on that script so you can run it:

    $ chmod u+x build.sh

Then run the script to make sure it works:

    $ ./build.sh

### Version Control

Finally it's time to get this little project into version control. We'll put it on GitHub so there's a public place for our Jenkins server to access the code.

First let's create a `.gitignore` file so we prevent the resulting box from getting checked into version control accidentally. Add the following at a minimum:

    centos63.box

Now set up a local Git repo:

    $ git init
    $ git add definitions Gemfile Gemfile.lock build.sh
    $ git commit -m "Initial project"

Set up [a new GitHub repository](https://github.com/new) and push you local repo to your GitHub one:

    $ git remote add origin https://github.com/spilth/veewee-centos63.git
    $ git push -u origin master 

## Automatic Box Building with Jenkins

Now it's time to set up Jenkins to build your base box for you whenever there's a change to it's definition.

### Installation

There's a Jenkins native package for most operating systems, so I suggest you download it from <http://jenkins-ci.org/>. The install package should automatically start Jenkins and you'll be able to get to it from your browser using: <http://localhost:8080/>

### Jenkins Plugins

You'll need a few plugins to help build the project. From the main Jenkins screen choose *Manage Jenkins*, then click *Manage Plugins*. Click on the *Available* tab and in the *Filter* box search for the following:

- "github" or <https://wiki.jenkins-ci.org/display/JENKINS/Github+Plugin>
- "rvm" or <https://wiki.jenkins-ci.org/display/JENKINS/RVM+Plugin>
- "s3" or <https://wiki.jenkins-ci.org/display/JENKINS/S3+Plugin>

#### Configure Git Plugin

From the main screen of Jenkins choose *Manage Jenkins*, then *Configure System*. Find the section titled *Git plugin* and enter values for *Global Config user.name* and *Global Config user.email*.

#### Configure Amazon S3 Plugin

On the *Configure System* screen also look for the section titled *Amazon S3*. Click on the *Add* button and set up a new profile with you access key and secret key.

### Creating a Jenkins Job

Now we need to create a job in Jekins that will check out your code from GitHub, run the build script we made, store the `centos63.box` it generates and push that box to our Amazon S3 Bucket.

- From the main screen click on *New Job*.
- Give the job a name
- Choose *Build a free-style project*
- Click *OK*
- Under *Source Code Management* choose *Git* and enter the Read-Only URL for your GitHub repository.
- Under *Build Environment* choose *Run the build in a RVM-managed environment* and enter `1.9.3` in the *Implementation* field.
- Under *Build* click *Add build step* and choose *Execute shell*. Enter `./build.sh` in the *Command* text area.
- Under *Post-build Actions* click *Add post-build action* and choose *Publish artifacts to S3 Bucket*. Choose the profile you created above, then click *Add*. In the *Source* field put `centos63.box` and put the name of your S3 bucket in the *Destination bucket* field.
* Click *Save* at the bottom of the page.
* Finally, click the *Build Now* link in the left-side nav to kick off your job. Once the job starts you can click the datestamp, then *Console Output* to see the log of the build script.

Note that it will take some time to download the CentOS ISO and Virtual Box extensions during the first build. It will download them to an `iso` directory in the job's workspace so future builds won't take as long.

Additionally, depending on the speed of your connection, uploading to Amazon S3 might take a while.

## Next Steps

In future parts I'll be going over the following:

- making the boxes in Amazon S3 bucket automatically readable using a bucket policy
- creating a Vagrant project to use the base box we've created
- configuring the Vagrant project to use Puppet and actually set up Apache, MySQL and PHP
- set up an Amazon EC2 instance running Jenkins to do the build instead of on my local machine (to speed up box uploads)

Additionally, I've put all the work described here on GitHub: <https://github.com/spilth/veewee-centos63>

