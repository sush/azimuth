require 'core_ext/hash'

module Azimuth
  # Methods for HTTP requests
  module Request
    # Make a HTTP POST request.
    #
    # @param path [String] The path, relative to api_endpoint
    # @param params [Hash] body params for request
    # @return [Hashie::Mash]
    def post(path, options={})
      request(:post, path, options)
    end

    private

    def request(method, path, params)
      params[:options].camelize_keys! if params[:options]

      response = connection.send(method) do |request|
        request.params['key'] = self.api_key

        case method
        when :post
          request.headers['Content-Type'] = 'application/json'
          request.path = path
          request.body = MultiJson.dump(params) unless params.empty?
        end
      end

      response.body
    end
  end
end
