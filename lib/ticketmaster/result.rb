module Ticketmaster
  class Result
    attr_accessor :data, :request

    def initialize(data, request)
      self.data = data
      self.request = request
    end

    def self.create(data, request, type)
      Object.const_get(type).new(data, request)
    end

    def self.search(data, request, type)
      result = Ticketmaster::Search.new(data, request)
      result.type = type
      result
    end

    def self.array(data, request, type)
      return [] if data.nil? || data.empty?
      results = data.map do |item|
        Object.const_get(type).new(item, request)
      end
    end
  end
end
