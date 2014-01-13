require 'azimuth/connection'
require 'azimuth/request'

require 'azimuth/client/route_matrix'

module Azimuth
  # Client for the MapQuest Directions API
  #
  # @see http://www.mapquestapi.com/directions
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS)

    def initialize(options={})
      options = Azimuth.options.merge(options)

      Configuration::VALID_OPTIONS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Azimuth::Connection
    include Azimuth::Request

    include Azimuth::Client::RouteMatrix
  end
end
