module JwtClaims
  module Claim
    # Not before
    # @see https://tools.ietf.org/html/rfc7519#section-4.1.5
    module Nbf

      module_function

      # @param numeric_date [Numeric] the number of seconds from 1970-01-01T00:00:00Z UTC
      #   until the specified UTC date/time; non-integer values may be used
      # @param options [Hash] (key :leeway_seconds, maximum of 180), time to allow for clock skew
      # @return [true, false] whether to reject the claim
      def reject?(numeric_date, options = {})
        return true unless numeric_date.is_a?(Numeric)
        seconds = Util.leeway_seconds(options.fetch(:leeway_seconds, 0))
        numeric_date > Time.now.to_i + seconds
      end
    end
  end
end
