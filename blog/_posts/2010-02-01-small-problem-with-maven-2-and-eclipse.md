--- 
layout: post
title: Small Problem with Maven 2 and Eclipse
tags: 
- Computers
- Programming

---
In an effort to prepare myself for potentially adding some Maven-based projects to our AntHill Pro system at work I grabbed the <a href="http://refcardz.dzone.com/refcardz/apache-maven-2">Apache Maven 2 Reference Card from Refcardz</a>. It was a good overview but didn't include some of the basics,  like creating a basic project. <a href="http://maven.apache.org/guides/getting-started/maven-in-five-minutes.html">Maven in 5 Minutes</a> on the Maven web site proved more useful for that, as did the <a href="http://maven.apache.org/guides/mini/guide-ide-eclipse.html">Guide to using Eclipse with Maven 2.x</a>.

I used <a href="http://www.macports.org/">MacPorts</a> to install Maven with the following:

<code>sudo port install maven</code>

I created a simple project using the following:

<code>mvn archetype:create -DgroupId=org.spilth.rpgam -DartifactId=rpgam</code>

And then tried to generate an Eclipse project file using:

<code>cd rpgam
mvn eclipse:eclipse
</code>

The command failed with the following error in the output:

<span style="font-family:monospace;">[WARNING] Unable to get resource 'jline:jline:jar:0.9.1' from repository central (http://repo1.maven.org/maven2): Specified destination directory cannot be created: /Users/brian/.m2/repository/jline/jline/0.9.1</span>

It suggested I manually download and install jline. I was not down with this because, well, I thought Maven was supposed to take care of this stuff for me - I shouldn't have to manually download and install stuff!

Upon looking in my ~/.m2/repository directory I noticed that some directories were owned by root and some by me. I'm not sure how or when this happened but I fixed it with the following:

<span style="font-family:monospace;">sudo chown -R brian /Users/brian/.m2/</span>

This fixed the problem and successfully created a .classpath and .project file for Eclipse.

I also started my own <a href="http://spilth.wikia.com/wiki/Maven">Maven cheat sheet</a>.

Lastly, I learned that you an open a Finder window for the current directory from Terminal by using:

<code>open .</code>
