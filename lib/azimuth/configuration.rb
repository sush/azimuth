module Azimuth
  # Methods for Azimuth configuration
  module Configuration
    # Configurable options
    VALID_OPTIONS = [
      :api_endpoint,
      :api_key,
    ].freeze

    # Default MapQuest Directions API endpoint
    DEFAULT_API_ENDPOINT = 'http://www.mapquestapi.com/directions/v2/'

    attr_accessor(*VALID_OPTIONS)

    # @private
    def self.extended(base_obj)
      base_obj.initialize_default_options
    end

    # Set configuration options using a block
    def configure
      yield self
    end

    # Default options
    def options
      VALID_OPTIONS.inject({}){ |o, k| o.merge!(k => send(k)) }
    end

    # Initialize default options
    def initialize_default_options
      self.api_endpoint = DEFAULT_API_ENDPOINT
      self.api_key = nil
    end

    # Reset configuration options to default values
    def reset!
      initialize_default_options

      self
    end
  end
end
