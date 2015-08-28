module JwtClaims
  module Claim
    # Issued at
    # @see https://tools.ietf.org/html/rfc7519#section-4.1.6
    module Iat

      module_function

      # @param numeric_date [Numeric] the number of seconds from 1970-01-01T00:00:00Z UTC
      #   until the specified UTC date/time, and non-integer values may be used
      # @param options [Hash] optional, ignored
      # @return [true, false] whether to reject the claim
      def reject?(numeric_date, _options = {})
        return true unless numeric_date.is_a?(Numeric)
        numeric_date >= Time.now.to_i
      end
    end
  end
end
