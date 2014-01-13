require 'multi_json'

module Azimuth
  # Custom error class
  class Error < StandardError
    # Returns the Error based on status and response message.
    #
    # @param [Hash] response HTTP response
    # @return [Azimuth::Error]
    def self.from_response(response)
      parsed_response_info = ::MultiJson.load(response[:body])['info']

      status_code = parsed_response_info['statuscode']

      return if status_code == 0

      if error_message = parsed_response_info['messages']
        error_message = error_message.join(' ')
      end

      case status_code
      when 400
        raise Azimuth::ErrorWithInput, error_message
      when 403
        raise Azimuth::KeyRelatedError, error_message
      when 500
        raise Azimuth::UnknownError, error_message
      when 600...699
        raise Azimuth::OtherError, error_message
      end
    end
  end

  # Raised when API returns 400 error code
  class ErrorWithInput < Error; end

  # Raised when API returns 403 error code
  class KeyRelatedError < Error; end

  # Raised when API returns 500 error code
  class UnknownError < Error; end

  # Raised when API returns error code between 600 and 699
  class OtherError < Error; end
end
