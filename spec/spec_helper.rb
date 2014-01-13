require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  add_filter 'spec'
  add_filter 'lib/azimuth/response'
end

require 'rspec'
require 'vcr'
require 'json'
require 'webmock/rspec'
require 'azimuth'
require 'uri'

Dir['./spec/support/**/*.rb'].each { |f| require f }

WebMock.disable_net_connect!(allow: 'coveralls.io')

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<API_KEY>') do
    URI.escape(test_api_key)
  end
  c.configure_rspec_metadata!
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end

def stub_post(url)
  stub_request(:post, map_quest_direction_url(url))
end

def map_quest_direction_url(url)
  "http://www.mapquestapi.com/directions/v2/#{url}?key=#{test_api_key}"
end

def test_api_key
  ENV.fetch('MAP_QUEST_API_KEY', 'test_api_key')
end

def client
  Azimuth.new(api_key: test_api_key)
end
