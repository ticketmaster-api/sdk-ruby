require_relative 'ticketmaster/client'
require_relative 'ticketmaster/request'
require_relative 'ticketmaster/result'
require_relative 'ticketmaster/results/search'
require_relative 'ticketmaster/results/event'
require_relative 'ticketmaster/results/image'
require_relative 'ticketmaster/results/venue'
require_relative 'ticketmaster/results/classification'
require_relative 'ticketmaster/results/attraction'

module Ticketmaster
  def self.client(options={})
    Ticketmaster::Client.new(options)
  end
end
