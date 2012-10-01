---
title: Rails 3 Time Zones, Dates & Times
layout: note
---

## Application Time Zone

If your Rails application and its users sit in one time zone (such as an Intranet site or local group site) then it's probably a good idea to set a time zone for your app so any dates entered or displayed are presented local to your users.

### List of Available Time Zones

There is a rake task available named `time` that has a list of available time zones.  

    $ rake -D time
    $ rake time:zones:all
    $ rake time:zones:us

For my application I want `Eastern Time (US & Canada)` as the time zone.

### Configure Your Application Time Zone

In `config/application.rb' add the following line:

    config.time_zone = 'Eastern Time (US & Canada)'

Then restart your Rails application for the change to take effect.

Dates and times will still be stored as UTC in your database but displayed as EST. Additionally, any dates that are provided via forms are now assumed to be EST.

## Date & Time Formatting

By default Dates and Times are displayed in a less than friendly format: `2012-02-26 17:11:49 -0500`. It's certainly decipherable but we want to provide something better to our users.

### Configure Custom Date & Time Formats

To provide your own date formattng globally across your application first edit or create `config/locales/en.yml` and add your custom formats.

    en:
      time:
        formats:
          default: "%A, %B %e, %Y %l:%M %p"
          long: "whatever..."

Date & Time formatting directives can be found in [Time#strftime's documentation](http://ruby-doc.org/core-1.9.3/Time.html#method-i-strftime)

### Display Dates & Times Using Your Custom Formats

Use the `l` helper (short for `localize`) in your views:

    <%= l post.created_at %>
    <%= l post.created_at, :format => :long %>

If you don't provide a `:format` then the `:default` format is used.

## Relative Date & Time Descriptions

Even nicer than a prettily formatted date are relative dates - telling your user something is from X minutes or days ago.

    <%= distance_of_time_in_words_to_now(story.created_at) %>

## User-Specific Date Formatting

If you're building a public web site your users are (hopefully) spread across several time zones, so you'll probably want to let them provide their personal time zone so dates and times are presented in their own timezone.

### User Timezone Preference

If you're using something like [Devise](https://github.com/plataformatec/devise) you can add a `timezone` field to the `User` model:

    $ rails g migration AddTimeZoneToUser time_zone:string

Probably a good idea to edit your migration to include a default:

    add_column :users, :time_zone, :string, :default => "UTC"

And then migrate your database:

    $ rake db:migrate

Edit your User class and make the time_zone attribute settable:

    attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login, :time_zone

Then customize the Devise views to include a Time Zone selection box.  If you haven't already generated the Devise views for editing:

    $ rails generate devise:views

Then edit `app/views/devise/registrations/edit.html.erb`:

    <%= f.collection_select :time_zone, ActiveSupport::TimeZone.all, :name, :to_s %>

If you're using [simple_form](https://github.com/plataformatec/simple_form) then you can use the following:

    <%= f.input :time_zone, :collection => ActiveSupport::TimeZone.all, :label_method => :to_s, :value_method => :name, :include_blank => false %>

### Time Zone Filter

Once a user has set their time zone you'll want to make sure to tell each request to your application to change to the user's time zone. In `app/controllers/application_controller.rb` add the following:

    before_filter :set_timezone 

    def set_timezone  
      Time.zone = current_user.time_zone if current_user
    end  

## JQuery Time Picker Add-on

I'm using the [JQuery Time Picker Add-on](https://github.com/trentrichardson/jQuery-Timepicker-Addon) on one of my sites and was haing a problem where I needed to put a datetime attribute in an HTML text field but the following would always be in the UTC time zone:

     <%= f.text_field(:visited_at) %>

So I used the `:value' option to set a specific value which ends up being localized:

     <%= f.text_field(:visited_at, :value => l(@report.visited_at, :format => :datepicker)) %>

## Resource

* [Rails Internationalization (I18n) API](http://guides.rubyonrails.org/i18n.html)
* [ActionView DateHelper](http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html)
* [ActionView FormOptionsHelper](http://api.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html)
* [ActiveSuppoer TimeZone](http://api.rubyonrails.org/classes/ActiveSupport/TimeZone.html)
* [DateTime](http://api.rubyonrails.org/classes/DateTime.html)
* [Date](http://api.rubyonrails.org/classes/Date.html)
* [Time](http://api.rubyonrails.org/classes/Time.html)
* [Ruby Time](http://ruby-doc.org/core-1.9.3/Time.html)
* [StackOverflow: Rails 3 - Setting the Time Zone to the Current User's Time Zone](http://stackoverflow.com/questions/4269270/rails-3-setting-the-timezone-to-the-current-users-timezone)
* [StackOverflow: Rails date format in a text_field](http://stackoverflow.com/questions/1449955/rails-date-format-in-a-text-field)
