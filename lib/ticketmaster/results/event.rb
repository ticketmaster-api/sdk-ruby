module Ticketmaster
  class Event < Result
    def id
      data['id']
    end

    def name
      data['name']
    end

    def url
      data['url']
    end

    def description
      data['description']
    end

    def please_notes
      data['pleaseNote']
    end

    def info
      data['info']
    end

    def accessibility
      data['accessibility'] ? data['accessibility']['info'] : nil
    end

    def ticket_limit
      data['ticketLimit'] ? data['ticketLimit']['info'] : nil
    end

    def embedded
      data['_embedded']
    end

    def dates
      data['dates']
    end

    def start
      dates['start']
    end

    def end
      dates['end']
    end

    def timezone
      dates['timezone']
    end

    def seatmap
      data['seatmap'].present? ? data['seatmap']['staticUrl'] : nil
    end

    def price_ranges
      data['priceRanges']
    end

    def sales
      data['sales']
    end

    def promoter
      data['promoters']
    end

    def images
      images = Result.array(data['images'], request, 'Ticketmaster::Image')
      images ||= get_images
    end

    def get_images
      request.client.get_event_images(id)
    end

    def classifications
      Result.array(data['classifications'], request, 'Ticketmaster::Classification')
    end

    def attractions
      Result.array(embedded['attractions'], request, 'Ticketmaster::Attraction')
    end

    def venues
      Result.array(embedded['venues'], request, 'Ticketmaster::Venue')
    end

    def reload
      data = request.client.get_event(id).data
      self
    end
  end
end
