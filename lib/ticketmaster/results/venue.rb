module Ticketmaster
  class Venue < Result
    def id
      data['id']
    end

    def name
      data['name']
    end

    def address
      data['address']
    end

    def state
      data['state']
    end

    def city
      data['city']['name']
    end

    def country
      data['country']['name']
    end

    def country_code
      data['country']['countryCode']
    end

    def location
      data['location']
    end

    def timezone
      data['timezone']
    end

    def postal_code
      data['postalCode']
    end

    def url
      data['url']
    end

    def reload
      data = request.client.get_venue(id).data
      self
    end
  end
end
