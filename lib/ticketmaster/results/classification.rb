module Ticketmaster
  class Classification < Result
    def id
      data['segment']['id']
    end

    def reload
      data = request.client.get_classification(id).data
      self
    end
  end
end
