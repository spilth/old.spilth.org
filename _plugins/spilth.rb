require "jekyll-minimagick"
require "liquid-eval"

module Liquid
  class VimeoTag < Liquid::Tag
    def initialize(name, id, tokens)
      super
      @id = id
    end

    def render(content)
      %Q{<iframe width="640" height="480" src="http://player.vimeo.com/video/#{@id}" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>}
    end
  end

  class YouTubeTag < Liquid::Tag
    def initialize(name, id, tokens)
      super
      @id = id.strip
    end

    def render(content)
      %Q{<iframe width="640" height="480" src="http://www.youtube.com/embed/#{@id}?color=white&theme=light"></iframe>}
    end
  end

  class ImageTag < Liquid::Tag
    def initialize(name, image, tokens)
      super
      @image = image
    end

    def render(context)
      %Q{<a href="/images/original/#{@image}"><img class="thumbnail" src="/images/small/#{@image}" width="320" height="240" /></a>}
    end
  end

  class SoundCloudTag < Liquid::Tag
    def initialize(name, id, tokens)
      super
      @id = id.strip
    end

    def render(context)
      %Q{<p><iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F#{@id}&amp;show_artwork=false"></iframe></p>}
    end
  end

  class RubyBlock < Liquid::Block
    def initialize(name, markup, tokens)
      super
      @code = @nodelist[0].to_s.gsub(/^$\n/, '')

      File.open('/tmp/ruby-foo.rb', 'w') {|f| f.write("#{@code}")}
      @result = `ruby /tmp/ruby-foo.rb`
    end

    def render(context)
      %Q[<h6>Code:</h6><pre><code>#{@code}</code></pre><h6>Output:</h6><pre class="output"><code>#{@result}</code></pre>]
    end

  end

  class SidebarBlock < Liquid::Block
    alias :super_render :render

    def initialize(tag_name, identifier, tokens)
      super
    end

    def render(context)
      context.environments.first["page"]["sidebar"] = super_render(context)
      ''
    end
  end
end

Liquid::Template.register_tag('ruby', Liquid::RubyBlock)
Liquid::Template.register_tag('sidebar', Liquid::SidebarBlock)
Liquid::Template.register_tag('image', Liquid::ImageTag)
Liquid::Template.register_tag('vimeo', Liquid::VimeoTag)
Liquid::Template.register_tag('youtube', Liquid::YouTubeTag)
Liquid::Template.register_tag('soundcloud', Liquid::SoundCloudTag)

LiquidEval.register_language('io', 'io', 'io')

