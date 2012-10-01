module Spilth
  module Liquid
    class FlickrTag < ::Liquid::Tag
      def initialize(tag_name, photo_id, tokens)
        super
        @photo_id = photo_id
      end

      def render(context)
        %q{<a href="http://www.flickr.com/photos/spilth/#{@photo_id}/"><img src="http://farm1.staticflickr.com/31/35932719_6293c3306d_m.jpg" width="240" height="180" alt="It's Electric!"></a>}
      end
    end
  end
end

Liquid::Template.register_tag('flickr_image', Spilth::Liquid::FlickrTag)

