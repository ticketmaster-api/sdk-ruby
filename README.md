Ruby SDK for the Ticketmaster Open Platform (http://developer.ticketmaster.com/).

Wraps the Ticketmaster API in easy to access functions.

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

#### Example:
```
require 'ticketmaster'

client = Ticketmaster.client(apikey: 'YOUR API KEY')
response = client.search_events
event = response.results.first
event.get_images
```
