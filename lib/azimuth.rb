require 'azimuth/configuration'
require 'azimuth/client'

# Ruby wrapper for MapQuest Directions API
module Azimuth
  extend Configuration

  class << self
    # Delegates to Azimuth::Client#new
    def new(options={})
      Azimuth::Client.new(options)
    end

    # @private
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    # @private
    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
