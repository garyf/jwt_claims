module JwtClaims
  module Claim
    # Expiration time
    # @see https://tools.ietf.org/html/rfc7519#section-4.1.4
    module Exp

      module_function

      # @param numeric_date [Numeric] the number of seconds from 1970-01-01T00:00:00Z UTC
      #   until the specified UTC date/time; non-integer values may be used
      # @return [true, false] whether to reject the claim
      def reject?(numeric_date, options = {})
        return true unless numeric_date.is_a?(Numeric)
        numeric_date <= Time.now.to_i
      end
    end
  end
end
