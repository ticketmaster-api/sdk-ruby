require './test/test_helper'

class ClientTest < Minitest::Test
  def test_exists
    assert Ticketmaster::Client
  end

  def test_search_events
    VCR.use_cassette('search_events') do
      client = Ticketmaster::Client.new(apikey: 'TEST')
      results = client.search_events.results

      assert_equal 20, results.length

      assert Ticketmaster::Event, results.first.class
    end
  end

  def test_get_event
    VCR.use_cassette('get_event') do
      client = Ticketmaster::Client.new(apikey: 'TEST')
      results = client.get_event('1Av8ZfaGkwmkMSH')

      assert '1Av8ZfaGkwmkMSH', results.id
    end
  end

  def test_get_event_images
    VCR.use_cassette('get_event_images') do
      client = Ticketmaster::Client.new(apikey: 'TEST')
      results = client.get_event_images('1Av8ZfaGkwmkMSH')

      assert_equal 10, results.length
      assert_equal 'http://s1.ticketm.net/dam/c/MISC_TABLET_LANDSCAPE_3_2.jpg', results.first.url
    end
  end

  def test_search_attractions
    VCR.use_cassette('search_attractions') do
      client = Ticketmaster::Client.new(apikey: 'TEST')
      results = client.search_attractions.results

      assert_equal 20, results.length
      assert_equal 'K8vZ9175BhV', results.first.id
    end
  end

  def test_get_attraction
    VCR.use_cassette('get_attraction') do
      client = Ticketmaster::Client.new(apikey: 'TEST')
      results = client.get_attraction('K8vZ9171ya0')

      assert_equal 'K8vZ9171ya0', results.id
    end
  end

  def test_search_classifications
    VCR.use_cassette('search_classifications') do
      client = Ticketmaster::Client.new(apikey: 'TEST')
      results = client.search_classifications.results

      assert_equal 6, results.length
      assert_equal 'KZFzniwnSyZfZ7v7na', results.first.id
    end
  end

  def test_get_classification
    VCR.use_cassette('get_classification') do
      client = Ticketmaster::Client.new(apikey: 'TEST')
      results = client.get_classification('KZFzniwnSyZfZ7v7nn', 'classifications')

      assert_equal 'KZFzniwnSyZfZ7v7nn', results.id
    end
  end

  def test_search_venues
    VCR.use_cassette('search_venues') do
      client = Ticketmaster::Client.new(apikey: 'TEST')
      results = client.search_venues.results

      assert_equal 20, results.length
      assert_equal 'KovZpZAFnIEA', results.first.id
    end
  end

  def test_get_venue
    VCR.use_cassette('get_venue') do
      client = Ticketmaster::Client.new(apikey: 'TEST')
      results = client.get_venue('KovZpZAFnIJA')

      assert_equal 'KovZpZAFnIJA', results.id
    end
  end

end
