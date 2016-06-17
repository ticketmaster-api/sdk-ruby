module Ticketmaster
  class Image < Result
    def url
      data['url']
    end

    def ratio
      data['ratio']
    end

    def width
      data['width']
    end

    def height
      data['height']
    end

    def is_fallback?
      data['fallback']
    end
  end
end
