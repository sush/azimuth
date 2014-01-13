module Azimuth
  class Client
    # Methods for the Route Matrix API
    #
    # @see http://www.mapquestapi.com/directions/#matrix
    module RouteMatrix
      # Get calculation of the distances and driving times between locations.
      # @param locations [Array] the locations
      # @param options [Hash] optional parameters
      # @option options [Hash] :manyToOne parameter
      # @option options [Hash] :allToAll parameter
      # @return [Hashie::Mash] the locations and their distance and traveling time
      # @see http://www.mapquestapi.com/directions/#matrix
      # @example
      #   Azimuth.route_matrix(['48.843079, 2.314442', '48.869061, 2.383329']
      def route_matrix(locations, options={})
        parameters = { locations: locations, options: options }

        format_response(post('routematrix', parameters))
      end

      private

      def format_response(response)
        response.locations.delete_at(0) unless response.allToAll

        response.locations.each_with_index.map do |location, i|
          Hashie::Mash.new(
            latitude: location.latLng.lat,
            longitude: location.latLng.lng,
            time: response.time[i],
            distance: response.distance[i]
          )
        end
      end
    end
  end
end
