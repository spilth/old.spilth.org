require "jekyll-minimagick"

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
      %Q{<p><a href="/images/original/#{@image}"><img class="img-polaroid" src="/images/small/#{@image}" width="320" height="240" /></a></p>}
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
end


Liquid::Template.register_tag('image', Liquid::ImageTag)
Liquid::Template.register_tag('vimeo', Liquid::VimeoTag)
Liquid::Template.register_tag('youtube', Liquid::YouTubeTag)
Liquid::Template.register_tag('soundcloud', Liquid::SoundCloudTag)

