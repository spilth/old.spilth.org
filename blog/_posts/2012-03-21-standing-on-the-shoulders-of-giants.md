---
title: Standing on the shoulders of giants...
layout: post
published: false
--- 

This year my job has me spending the majority of my time working on a software development project using Ruby on Rails. It's nice to finally have a Rails project where the "customer" is not myself and I have somebody who is expecting me to deliver value to them.

I started thinking about all the tools, libraries and learning resources I've been using lately and wanted to make note of the ones that really shine for me. They all make my work a lot easier so I wanted to show some appreciation.

## Project and Workload Management

I am running the project myself using 2 week iterations. I work with the project owner to determine the priority of features and I estimate the difficulty of each of those features. At the end of each 2 week iteration I demo the functionality I managed to add. I'm using [Pivotal Tracker](https://www.pivotaltracker.com/) to manage all this and it's working pretty well for me.

For my other, non-project work I use [Trello](https://trello.com/) to manage my workload using the [Personal Kanban](http://www.personalkanban.com/pk/) system. I keep track of what I need to do "Today", "This Week", "Soon" and "Eventually". I also have a column for anything I'm "Waiting" on - be it a reply from somebody or someone else's work. I also manage an "as we have time" project on Trello with two others which allows us to easily see what we've completed and what still needs to be done.

<a href="https://skitch.com/spilth/8cf9f/software-development-trello"><img src="https://img.skitch.com/20120322-1cdunrsjwj6bq5ekpncbmi8htd.preview.jpg" alt="Software Development | Trello" /></a>

For my daily tasks and main project features I use [The Pomodoro Technique](http://www.pomodorotechnique.com/) (specifically the [Pomodoro Mac App](http://pomodoro.ugolandini.com/)) to help me stay focused, take regular breaks and track what I've worked on each day. The Pomodoro app has a neat feature that automatically adds an event to your iCal each time you finish a Pomodoro. This helps me track how much time I'm spending on things, improves my estimation skills and gives me an easy way to report out what I worked on that week.

I will sometimes often go a little more bare bones and just create a text file where I break down a feature or task in to smaller steps to help  determine and guide what I need to do.  These sometimes also turn into useful work notes for reference. I am finding that sometimes my Stories in Pivotal Tracker are a little too broad and should consider using the text file to help break down stories so they are more easily estimated and prioritized.

## Terminal and Editor

In the last few months I started using [vim](http://www.vim.org/) as my main text editor. Originally I was using MacVim but I recently decided to go a little more hard core/bare bones and I use straight vim now. This allowed me to also start using [tmux](http://tmux.sourceforge.net/) to manage multiple terminal windows and panes for a customized development environment. 

At home I have OS X Lion but am still on Snow Leopard at work. Lion's Terminal program now supports 256 colors but unfortunate the Snow Leopard doesn't. This promoted me to check out [iTerm 2](http://www.iterm2.com/) since it supports 256 colors on both Snow Leopard and Lion. This allows me to use a large color palette for styling both tmux and vim.

## Ruby and Rails 

For managing my Rub environment I use [rvm](https://rvm.beginrescueend.com/).  This is handy because I need to use both Ruby 1.8 and 1.9 for my project - the Rails app runs on 1.9 but a command-line tool I made needs to run on 1.8.

If you follow me on twitter then you likely know that I've fallen in love with [Twitter Bootstrap](http://twitter.github.com/bootstrap/). It's a CSS/JavaScript framework that provides a clean and beautiful set of CSS stylings and JavaScript interactions. It allows me, as a design-challenged developer, to focus on functionality and not have to worry about implementing a simple, consistent style across sites, especially when they are internal sites. Coupled with[DataTables](http://datatables.net/) you can make some fast, clean web tools!

There are a number of Ruby Gems I've found very useful while developing this web application:

### [RSpec](http://rspec.info/)

I've been trying to make a more concerted effort to use Test Driven Development for my projects but I'm still struggling with it a bit. The Rails team at work uses RSpec and the Rails books I have discuss it so I figured it would be the best testing framework for me to start with so I have some support to fall back on.

### [shoulda](https://github.com/thoughtbot/shoulda)

shoulda adds a number of convenient "matchers" to RSpec (and TestUnit, if you're using that) that allow me to write more succint and expressive tests. Only just getting started with this library.

### [FactoryGirl]()

FactoryGirl seems to be a very popular replacement for using Fixtures in Rails. It's another gem I need to delve into some more but out of the box it saves me time in setting up data to test against.

### [guard](https://github.com/guard/guard)

I got tired of manually running `rake spec` and [autotest](http://www.zenspider.com/ZSS/Products/ZenTest/) was giving me issues so I decided to check out Guard. It gives you a simple way of watching files using regular expressions so it knows when it automatically kick off your tests. It also has a ton of extensions allowing for integration with Growl, Bundler, your browser, etc.

### [Sunspot](http://sunspot.github.com/)

Sunspot is a dead simple way to integrate your Rails app with [Solr](http://lucene.apache.org/solr/) and provide search functionality.

### [rabl](https://github.com/nesquena/rabl)

I need to provide a Rest API that delivers both JSON and XML. rabl is a templating language that lets you deliver both (and more) using the same template code.

### [delayed_job](https://github.com/collectiveidea/delayed_job)

One of the tasks the Rest API provides requires a fair amount of time to run - enough that a client shouldn't be waiting around for. delayed_job allows me to easily push that task to a background task to be dealt with outside the scope of the API call.

### [NokoGiri]()

The job I'm doing as a background process requires parsing an XML file. I'm doing that using NokoGiri.

### [Devise]()

Authentication is done with Devise.

### [CanCan]()

I'm using Ryan Bates' CanCan to manage user permissions. Currently doing this with my own User/Role/Permission system.

### [erd](http://rails-erd.rubyforge.org/)

There are a number of models and relationships in the system and the erd Gem lets me easily generate a diagram of thme as a PDF.

## Books

There are a number of books I've purchase that have been very handy and enlightening. Fair warning: I love [The Pragmatic Bookshelf](http://pragprog.com/) so be prepared to see a lot of books by them.

### [The Agile Samurai: How Agile Masters Deliver Great Software](http://pragprog.com/book/jtrap/the-agile-samurai)

This book helped model how I'm managing the project with 2 week iterations, planning meetings, demonstrations and "standup" meetings.

### [Personal Kanban](http://www.personalkanban.com/)

Describes the Personal Kanban technique I've been using to manage both work and personal tasks. My girlfriend and I use it whenever we have a bunch of things to take care of, either with a white board and some post its or just using Trello.

### [Pomodoro Technique Illustrated: The Easy Way to Do More in Less Time](http://pragprog.com/book/snfocus/pomodoro-technique-illustrated)

Describes the Pomodoro Technique (which I'm sure you guessed). It's all about doing your work in timed iterations (25 minute "pomodoros" by default) and taking frequent breaks. You can also use it to plan out your work for the day, estimate how many "Pomodoros" something will take, manage/record interruptions and track your work.

### [Rails Test Prescriptions: Keeping Your Application Healthy](http://pragprog.com/book/nrtest/rails-test-prescriptions)

This is the most helpful Rails Testing book I've read so far. It goes over TestUnit, RSpec, shoulda, FactoryGirl and a number of other helpful libraries. A good investment!

### [Build Awesome Command-Line Applications in Ruby: Control Your Computer, Simplify Your Life](http://pragprog.com/book/dccar/build-awesome-command-line-applications-in-ruby)

I originally bought this as just a way to learn a little more Ruby but it ended up becoming extra helpful when I needed to create a small command-line utility for my work project.

### [Rails Recipes](http://pragprog.com/book/rr2/rails-recipes)

This book describes how to accomplish a number of tasks in Rails at the various different layers of an application (mode, view, controller, mailer, database, etc.)  It's been helpful to skim through this and pick out recipes as needed or randomly and see how one might accomplish things.

### [tmux](http://pragprog.com/book/bhtmux/tmux)

This is the book that initially got me interested in tmux. It's a quick read and straighforward explanation of how to get up and running with tmux, how to control it, configure it and even provides some example workflows. There's also a chapter on Remote Pairing with tmux but that currently isn't applicable to me right now.

In fact, this blog post was written using tmux with a pair of windows: one with `vim` and `jekyll --server` running and the other for running `jekyll-s3`. 

## Online Learning

### [Stack Overflow](http://stackoverflow.com/)

This is the place to go if you have software development questions. It uses a reputation system to help moderate questions, answers and comments. These I find most technical problems that I Google end up taking me to Stack Overflow.

There are [a bunch of Question/Answer sites using the StackExchange system](http://stackexchange.com/sites). Another favorite of mine is [http://gis.stackexchange.com/](http://gis.stackexchange.com/)

### [Code School](http://zfer.us/nUBCS)

I've been following Greg Pollack since his [Rails Envy](http://blog.envylabs.com/2010/04/rails-envy/) days. His latest endeavor (along with [the team at Envy Labs](http://envylabs.com/team)) is Code School - "an online learning platform that teaches a variety of programming and web design skills".

Each course consists of several "levels" where you first watch an instructional video and then work through code challenges to re-inforce what you just learned. They also produce a series of single video [Code TV Screencasts](http://www.codeschool.com/code_tv) which cover a variety of topics.

It's subscription-based, but considering the production quality, the in-browser code editor and amount of material they have it's well worth the cost.

Some of the courses I've founded especially helpful are:

- [Rails for Zombies](http://www.codeschool.com/courses/rails-for-zombies)
- [Rails for Zombies 2](http://www.codeschool.com/courses/rails-for-zombies-2)
- [Rails Best Practices](http://www.codeschool.com/courses/rails-best-practices)
- [Rails Testing for Zombies](http://www.codeschool.com/courses/rails-testing-for-zombies)

### [RailsCasts](http://railscasts.com/)

Another icon in the Ruby/Rails community is Ryan Bates. Ryan has been producing screencasts about Rails since 2007. He currently has over 300, several of which have updated versions as well. His screencasts usually weigh in around 9 minutes or so and each includes example code, hepful links and a GitHub repository where you can get the project from each episode. RailsCasts was originally free but Ryan recently started charging - and rightfully so! At only $9 a month RailsCasts is an incredible value! And you can still get a huge number of episodes for free, so go check it out!

Here are a few of the RailsCasts I've found useful recently:

- [rabl](http://railscasts.com/episodes/322-rabl)
- [delayed_job](http://railscasts.com/episodes/171-delayed-job-revised)
- [sunspot](http://railscasts.com/episodes/278-search-with-sunspot)
- [guard](http://railscasts.com/episodes/264-guard)

## News & Updates

I use Google Reader to follow blogs and news feeds for a number of my interests: DevOps, GIS, Programming, Rails, etc. I think the easiest thing to do here is to just share my [Google Reader - Ruby on Rails Bundle](http://www.google.com/reader/bundle/user%2F05195942667795994118%2Fbundle%2FRuby%20on%20Rails)

## My Notes

Finally, I try my best to take notes while I'm working on something or learning something new. I find that organizing and typing out my thoughts often helps reinforce what I've learned. It also helps serve as an excellent reminder when I forget something too!

- [tmux](/notes/tmux/)
- [vim](/notes/vim/)
- [rvm](/notes/rvm/)
- [Git & Subversion](/notes/git-svn/)
- [Rails Custom Scaffolding](/notes/rails3-custom-scaffolding/)
- [Rails Time Zones and Date Formatting](/notes/rails3-date-time/)

