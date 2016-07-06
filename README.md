[![Build Status](https://travis-ci.org/ticketmaster-api/sdk-ruby.svg?branch=master)](https://travis-ci.org/ticketmaster-api/sdk-ruby)

Ruby SDK for the Ticketmaster Open Platform (http://developer.ticketmaster.com/).

Wraps the Ticketmaster API in easy to access functions.

#### Installation
```
gem install ticketmaster-sdk
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
 10. Get Legacy Event (legacy Ticketmaster IDs)

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
| get_legacy_event       | id            |

Pass optional params to the call via options.params:
```
require 'ticketmaster-sdk'

params = {page: 5, size: 10, source: 'ticketmaster'}
client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_events(params: params)
events = response.results
```

##### Search Events(options={})
```
require 'ticketmaster-sdk'

params = {page: 5, size: 10, source: 'ticketmaster'}
client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_events(params: params)
events = response.results
```

##### Get Event (id, options={})
```
require 'ticketmaster-sdk'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
event = client.get_event('ID OF EVENT')
```

##### Get Event Images (id, options={})
```
require 'ticketmaster-sdk'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.get_event_images('ID OF EVENT')
images = response.results
```

##### Search Attractions (options={})
```
require 'ticketmaster-sdk'

params = {page: 5, size: 10, source: 'ticketmaster'}
client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_attractions(params: params)
attractions = response.results
```

##### Get Attraction(id, options={})
```
require 'ticketmaster-sdk'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
attraction = client.get_attraction('ID OF ATTRACTION')
```

##### Search Classifications (options={})
```
require 'ticketmaster-sdk'

params = {page: 5, size: 10, source: 'ticketmaster'}
client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_classifications(params: params)
classifications = response.results
```

##### Get Classification (id, options={})
```
require 'ticketmaster-sdk'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
classification = client.get_classification('ID OF CLASSIFICATION')
```

##### Search Venues (options={})
```
require 'ticketmaster-sdk'

params = {page: 5, size: 10, source: 'ticketmaster'}
client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_venues(params: params)
venues = response.results
```

##### Get Venue(id, options={})
```
require 'ticketmaster-sdk'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
venue = client.get_venue('ID OF VENUE')
```

##### Get Legacy Event(id, options={})
```
require 'ticketmaster-sdk'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
event = client.get_legacy_event('LEGACY TICKETMASTER ID OF EVENT')
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
require 'ticketmaster-sdk'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_events
event = response.results.first
event.get_images
```

```
require 'ticketmaster-sdk'

params = {page: 5, size: 10, source: 'ticketmaster'}
client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_events(params: params)
events = response.results
```

```
require 'ticketmaster-sdk'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_venues
venue = response.results.first
venue.address
```

```
require 'ticketmaster-sdk'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_events
next = response.next_result
```
