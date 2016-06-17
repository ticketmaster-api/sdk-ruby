require './test/test_helper'

class ClientTest < Minitest::Test
  def test_exists
    assert Ticketmaster::Client
  end

  def initialize_returns_client
    client = Ticketmaster::Client.new(apikey: 'TEST123')
    assert_equal Ticketmaster::Client, client.class

    # Check that the fields are accessible by our model
    assert_equal 'TEST123', client.api_key
  end
end
