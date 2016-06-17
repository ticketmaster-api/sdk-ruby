require 'faraday'
require 'json'
require_relative 'configuration'

module Ticketmaster
  class Request
    include Configuration

    attr_accessor :path, :params, :client, :method

    def initialize(path, params, client)
      self.path   = path
      self.params = params
      self.client = client
    end

    def get
      conn = Faraday.new(:url => 'https://app.ticketmaster.com')
      response = conn.get path, formatted_params
      JSON.parse(response.body)
    end

    private

    def formatted_params
      params.delete_if {|key, value| !PERMITTED_PARAMS.include? key }
      params[:apikey] ||= client.apikey
      params[:format]   = 'json'
      params
    end
  end
end

