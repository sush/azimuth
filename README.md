# Azimuth

Simple Ruby wrapper for the [MapQuest Directions API](http://www.mapquestapi.com/directions).

**Current version**: [![Gem Version](https://badge.fury.io/rb/azimuth.png)](http://badge.fury.io/rb/azimuth)

**Build status**: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[![Build Status](https://secure.travis-ci.org/sush/azimuth.png?branch=master)](http://travis-ci.org/sush/azimuth)

**Code metrics**:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[![Code Climate](https://codeclimate.com/github/sush/azimuth.png)](https://codeclimate.com/github/sush/azimuth)
[![Coverage Status](https://coveralls.io/repos/sush/azimuth/badge.png?branch=master)](https://coveralls.io/r/sush/azimuth?branch=master)

**Ruby support**:

- 1.9.2
- 1.9.3
- 2.0.0
- 2.1.0

## Installation

Install via Rubygems

    gem install azimuth

or add to your Gemfile

    gem 'azimuth'

### Configuration

API methods are available as module methods

```ruby
Azimuth.configure do |c|
  c.api_endpoint = 'http://newendpoint/'
  c.api_key = 'YOUR_MAP_QUEST_API_KEY'
end
```

or as client instance methods

```ruby
Azimuth::Client.new(
	api_endpoint: 'http://newendpoint/',
	api_key: 'YOUR_MAP_QUEST_API_KEY',
)
```

## Authentication

Azimuth only supports authentication via an API key.

You can request one following these [steps](http://developer.mapquest.com/web/products/open).

## Usage


```ruby
locations = Azimuth.route_matrix(["48.843079, 2.314442", "48.869061, 2.383329"])
p locations
# => [{"latitude"=>48.869061, "longitude"=>2.383329, "time"=>0, "distance"=>0}]

# etc…
```

## Features

Azimuth supports the following MapQuest Directions API methods:

- [Route Matrix](http://www.mapquestapi.com/directions/#matrix)

Complete Azimuth public API's documentation [here](http://rubydoc.info/gems/azimuth/frames).


## Similar libraries

- [mapquest](https://github.com/ggordan/mapquest)

## Versioning
Azimuth follows the principles of [semantic versioning](http://semver.org).

1. Patch level releases contain only bug fixes.
2. Minor releases contain backward-compatible new features.
3. Major new releases contain backwards-incompatible changes to the public API.

## Contributing

Pull Requests are welcome !

Please refer to the [Contributing guide](https://github.com/sush/azimuth/blob/master/CONTRIBUTING.md) for more details on how to run the test suite and to contribute.


## Copyright

Copyright © 2014 Aylic Petit

Released under the terms of the MIT licence. See the [LICENSE](https://github.com/sush/azimuth/blob/master/LICENSE) file for more details.
