module Ticketmaster
  class Client
    require_relative 'clients/discovery'
    include Ticketmaster::Client::Discovery

    attr_accessor :apikey

    def initialize(options={})
      self.apikey = options[:apikey]
    end
  end
end
