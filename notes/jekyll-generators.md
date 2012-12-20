---
title: Jekyll Generators
layout: note
---

Create a _plugins directory.
As long as `safe` isn't set in your config file, any `.rb` files in the _plugins directory will be required when your site is generated.

Create a Generator class that implements the generate(site) method and append that page to the site:

Generator is a subclass of Plugin but doesn't provide any actual functionality beyond Plugin:
https://github.com/mojombo/jekyll/blob/master/lib/jekyll/generator.rb

Plugin is a base class. It provides some class methods for getting at it's subclasses:
https://github.com/mojombo/jekyll/blob/master/lib/jekyll/plugin.rb#L24

When you run Jekyll, it first sets up a new site instance:
https://github.com/mojombo/jekyll/blob/master/bin/jekyll#L238

Which ends up calling `reset` and `setup` on the site as well.

Then, in one form another, the main Jekyll script ends up calling `site.process`:
https://github.com/mojombo/jekyll/blob/master/bin/jekyll#L253
https://github.com/mojombo/jekyll/blob/master/bin/jekyll#L264

Which in turn calls a number of methods, including `generate`

During site.setup, each plugin is required, then each Converter and Generator is instantiated using the `subclasses` method provided by the Plugin class: https://github.com/mojombo/jekyll/blob/master/lib/jekyll/site.rb#L83
https://github.com/mojombo/jekyll/blob/master/lib/jekyll/site.rb#L89

Then during site.generate it calls `generate` on each generator and passes the site object:
https://github.com/mojombo/jekyll/blob/master/lib/jekyll/site.rb#L190


module Jekyll
  class YourPageGenerator < Generator
    safe true

    def generate(site)
		site.pages << YourPage.new(site, site.source, File.join(dir, category), category)
	end
  end
end

Create a subclass of Jekyll::Page that implements the initializer used in  your generator, such as initialize(site, base, dir, category) method.

module Jekyll
  class YourPage < Page
    def initialize(site, base, dir, category)

    end
  end
end
