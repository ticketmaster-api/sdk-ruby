[![Build Status](https://travis-ci.org/ticketmaster-api/sdk-ruby.svg?branch=master)](https://travis-ci.org/ticketmaster-api/sdk-ruby)

Ruby SDK for the Ticketmaster Open Platform (http://developer.ticketmaster.com/).

Wraps the Ticketmaster API in easy to access functions.

#### Installation
```
gem install ticketmaster-api
```
or in Gemfile
```
gem 'ticketmaster-sdk'
```

#### WIP Currently Covers:
1. **Discovery**
 1. Search Events
 2. Search Attractions
 3. Search Classifications
 4. Search Venues
 5. Get Events
 6. Get Event's Images
 7. Get Attractions
 8. Get Classification
 9. Get Venue

#### Methods:
For a list of parameters, check http://developer.ticketmaster.com/

| Discovery Methods      | Required      |
| ---------------------- |:-------------:|
| search_events          |               |
| get_event              | id            |
| get_event_images       | id            |
| search_attractions     |               |
| get_attraction         | id            |
| search_classifications |               |
| get_classification     | id            |
| search_venues          |               |
| get_venue              | id            |

Pass optional params to the call via options.params:
```
require 'ticketmaster'

params = {page: 5, size: 10, source: 'ticketmaster'}
client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_events(params: params)
events = response.results
```

##### Search Events(options={})
```
require 'ticketmaster'

params = {page: 5, size: 10, source: 'ticketmaster'}
client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_events(params: params)
events = response.results
```

##### Get Event (id, options={})
```
require 'ticketmaster'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.get_event('ID OF EVENT')
events = response.results
```

##### Get Event Images (id, options={})
```
require 'ticketmaster'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.get_event_images('ID OF EVENT')
events = response.results
```

##### Search Attractions (options={})
```
require 'ticketmaster'

params = {page: 5, size: 10, source: 'ticketmaster'}
client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_attractions(params: params)
events = response.results
```

##### Get Attraction(id, options={})
```
require 'ticketmaster'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.get_attraction('ID OF ATTRACTION')
events = response.results
```

##### Search Classifications (options={})
```
require 'ticketmaster'

params = {page: 5, size: 10, source: 'ticketmaster'}
client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_classifications(params: params)
events = response.results
```

##### Get Classification (id, options={})
```
require 'ticketmaster'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.get_classification('ID OF CLASSIFICATION')
events = response.results
```

##### Search Venues (options={})
```
require 'ticketmaster'

params = {page: 5, size: 10, source: 'ticketmaster'}
client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_venues(params: params)
events = response.results
```

##### Get Venue(id, options={})
```
require 'ticketmaster'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.get_venue('ID OF VENUE')
events = response.results
```

#### Objects:

##### Search Results
Methods:
* results
* current_page
* total_pages
* next_page
* previous_page
* next_result
* previous_result
* reload

##### Event
Methods:
* id
* name
* description
* embedded
* dates
* start
* end
* timezone
* images
* get_images
* classifications
* attractions
* venues
* reload

##### Venue
Methods:
* id
* name
* address
* state
* city
* country
* country_code
* location
* timezone
* postal_code
* url
* reload

##### Image
Methods:
* url
* ratio
* width
* height
* is_fallback?

##### Classification
Methods:
* id
* name
* reload
* genres
* subgenres
* type

##### Attraction
Methods:
* id
* name
* type
* url
* locale
* images
* classifications
* reload


#### Examples:
```
require 'ticketmaster'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_events
event = response.results.first
event.get_images
```

```
require 'ticketmaster'

params = {page: 5, size: 10, source: 'ticketmaster'}
client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_events(params: params)
events = response.results
```

```
require 'ticketmaster'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_venues
venue = response.results.first
venue.address
```

```
require 'ticketmaster'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_events
next = response.next_result
```
