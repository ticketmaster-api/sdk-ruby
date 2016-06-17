module Ticketmaster
  class Classification < Result
    def id
      data['id'] || data['segment']['id']
    end

    def name
      data['name'] || data['segment']['name']
    end

    def genres
      Result.array(data['segment']['_embedded']['genres'], request, 'Ticketmaster::Classification') if data['segment']['_embedded']['genres']
    end

    def subgenres
      Result.array(data['segment']['_embedded']['subgenres'], request, 'Ticketmaster::Classification') if data['segment']['_embedded']['subgenres']
    end

    def type
      data['_links']['self']['href'].match(/(?<=\/discovery\/v\d\/)[a-z\/]+(?=\/)/)[0]
    end

    def reload
      data = request.client.get_classification(id, type).data
      self
    end
  end
end
