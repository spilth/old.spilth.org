---
title: Automated VM Generation with veewee, Vagrant, Jenkins and Amazon S3 - Part 2
layout: post
---

Now that we have [a base box successfully building using veewee](/blog/2013/01/21/automated-vm-generation-with-veewee-jenkins-and-amazon-s3/), it's time to create a Vagrant project that will generate a box that we'll eventually customize with packages and services using Puppet.

Here's a diagram of the workflow we're shooting for:

{% image veewee-vagrant-workflow.png %}

We'll be using the same tools as last time.

## Vagrant Project

First we'll make a separate project directory to hold our Vagrant project completely outside of the veewee project.

{% highlight console %}
$ cd .. # if you're still in veewee-centos63
$ mkdir vagrant-centos63
$ cd vagrant-centos63
{% endhighlight %}

### Define Gem Dependencies

Once again we'll be using a Gemfile to manage our dependencies - well, one dependency. So in your `Gemfile` put the following:

{% highlight ruby %}
source :rubygems

gem 'vagrant', '1.0.5'
{% endhighlight %}

And run bundler to install Vagrant:

{% highlight console %}
$ bundle
{% endhighlight %}

Yes, you'll possibly have Vagrant installed already from the veewee project but remember that we'll be automatically building this project in Jenkins within it's own [RVM Gem Set](https://rvm.io/gemsets/) so we need to declare it's dependencies separately. Additionally, if anybody checks out your Vagrant project they won't need to know anything about the veewee one as well if it's completely self contained.

### Import Base Box into Vagrant

If you haven't already done so, you need to add the box you created in the veewee project (or whatever [public Vagrant base box](http://www.vagrantbox.es/) you'd like to use) to Vagrant itself.

If you followed the previous post you can do:
 
{% highlight console %}
$ vagrant box add centos63 ../veewee-centos63/centos63.box
{% endhighlight %}

If you didn't, you can try:
   
{% highlight console %}
$ vagrant box add centos63 http://boxes.spilth.org/centos63.box
{% endhighlight %}

And lastly you could try the following:

{% highlight console %}
$ vagrant box add centos63 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.3-x86_64-v20130101.box
{% endhighlight %}

Any of those commands will download a base box and put it in your home directory under `~/.vagrant.d/boxes/`.

### Create Vagrant Definition

With the Vagrant gem installed we can now create a `Vagrantfile` that we'll use to customize how our box is built. This is a Ruby script that defines things like network settings, file shares and provisioning tools used to configure the VM.

{% highlight console %}
$ vagrant init centos63
{% endhighlight %}

The Vagrantfile will assume that the base box you are building off of has already been added. Since we want Jenkins to be able to build off of the CentOS base box we put on S3, let's add the URL to it in our Vagrantfile. Find the commented out line with `config.vm.box_url`, uncomment it and add the URL to the base box you made with veewee.

{% highlight ruby %}
config.vm.box_url = "http://boxes.spilth.org/centos63.box"
{% endhighlight %}

### Automating the Build

We'll be customizing the box further by using Puppet but for now let's script building the box as is. Once that's in place we can make whatever changes we want and kick off the build script to re-build the box.

It's time to make another `build.sh`:

{% highlight bash %}
#!/bin/bash

BOXNAME=centos63-lamp.box

bundle install

rm -f $BOXNAME

bundle exec vagrant up
bundle exec vagrant package --output $BOXNAME
{% endhighlight %}

This script will install the Vagrant gem via Bundler and the Gemfile, remove the generated box if it already exists, start up the box, then export it as a file. Run `./build.sh` and make sure it works before we put our code in version control.

### Version Control

For the Vagrant project you'll want to check the following files/directories into version control:

- .gitignore
- Gemfile
- Gemfile.lock
- Vagrantfile
- build.sh

You'll want to make sure that your `.gitignore` file has the following:

    *.box

Create a GitHub project and push your local repo there just like you did for the veewee project.

## Automatic Box Building with Jenkins

For automating the build in Jenkins you will need to install and configure the same plugins mentioned in [part 1 of this series](/blog/2013/01/21/automated-vm-generation-with-veewee-jenkins-and-amazon-s3/).

### Create the Jenkins Job

The Jenkins setup is the same as last time as well except you'll want to give it a different name, the GitHub URL for your Vagrant project and change the *Publish artifacts to S3 Bucket* action to use the Vagrantfile's box name you chose in the build script.

Save your new job and click the *Build Now* link. Soon you'll have a 

#### Build Triggers

Whenever you update and run the veewee project you will likely want to then kick off the Vagrant build to use the latest version of the base box. To set this up go the *Build Triggers* section of the job configuration and check off *Build after other projects are built* and enter the veewee project name there.

## Using the Box

Anybody who wants to use your box can now execute the following:

    $ mkdir lamp
    $ cd lamp
    $ vagrant box add centos63-lamp http://boxes.spilth.org/centos63-lamp.box
    $ vagrant init my_box
    $ vagrant up
    $ vagrant ssh

## Next Steps

Now that we have an automated build process in place we can start to customize our box to include the packages and services we want to run on it and it will automatically build and push out to Amazon S3 every time we push our changes to GitHub. So next time we'll start using Puppet to turn our VM into a LAMP box!

To see a completed version of the Vagrant project head to <https://github.com/spilth/vagrant-centos63>

