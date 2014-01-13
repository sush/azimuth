require 'faraday'
require 'azimuth/error'

module Azimuth
  # Faraday response middleware
  module Response
    # Raises a Azimuth exception based on status code returned by the API
    class RaiseError < Faraday::Response::Middleware
      private

      def on_complete(response)
        if error = Azimuth::Error.from_response(response)
          raise error
        end
      end
    end
  end
end
