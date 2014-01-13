require 'faraday_middleware'
require 'azimuth/response/raise_error'

module Azimuth
  # Faraday connection methods
  module Connection
    private

    def connection
      options = {
        ssl: { verify: false },
        url: self.api_endpoint,
      }

      connection = Faraday.new(options) do |conn|
        conn.response(:mashify)
        conn.response(:json, content_type: /\bjson$/)

        conn.use(Azimuth::Response::RaiseError)
        conn.use(FaradayMiddleware::FollowRedirects, limit: 3)

        conn.adapter(Faraday.default_adapter)
      end

      connection
    end
  end
end
