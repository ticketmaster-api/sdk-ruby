module Ticketmaster
  class Search < Result
    attr_accessor :type

    def results
      data['_embedded'][type].map do |event|
        Result.create(event, request, "Ticketmaster::#{type.capitalize.chop}")
      end
    end

    def current_page
      data['page']['number']
    end

    def total_pages
      data['page']['totalPages']
    end

    def next_page
      current_page + 1 if current_page < total_pages
    end

    def previous_page
      current_page - 1 if current_page > 0
    end

    def next_result
      if next_page
        params = request.params.merge(page: next_page)
        result = request.client.send "search_#{type}".to_sym, params: params
      end
    end

    def previous_result
      if previous_page
        params = request.params.merge(page: previous_page)
        result = request.client.send "search_#{type}".to_sym, params: params
      end
    end

    def reload
      data = request.get
    end
  end
end
