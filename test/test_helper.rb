require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

require './lib/ticketmaster-sdk'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
end
