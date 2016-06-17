module Ticketmaster
  class Attraction < Result
    def id
      data['id']
    end

    def name
      data['name']
    end

    def type
      data['type']
    end

    def url
      data['url']
    end

    def locale
      data['locale']
    end

    def images
      images = Result.array(data['images'], request, 'Ticketmaster::Image')
    end

    def classifications
      Result.array(data['classifications'], request, 'Ticketmaster::Classification')
    end

    def reload
      data = request.client.get_attraction(id).data
      self
    end
  end
end
