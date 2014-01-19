require 'active_support/core_ext/string/inflections'

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
      camelize_options_keys(params[:options])

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

    def camelize_options_keys(options)
      return unless options

      camelized_options = options.inject({}) do |opt, v|
        opt.merge!(v.first.to_s.camelize(:lower) => v.last)
      end

      options.replace(camelized_options)
    end
  end
end
