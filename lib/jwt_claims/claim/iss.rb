require 'jwt_claims/string_or_uri'

module JwtClaims
  module Claim
    # Issuer
    # @see https://tools.ietf.org/html/rfc7519#section-4.1.1
    module Iss

      module_function

      # @param iss [String] the principal that issued the JWT
      # @param options [Hash] (key iss:) expected issuer to match with claim
      # @return [true, false] whether to reject the claim
      def reject?(iss, options = {})
        expected_issuer = options.fetch(:iss, nil)
        !StringOrUri.present_and_equal?(iss, expected_issuer)
      end
    end
  end
end
