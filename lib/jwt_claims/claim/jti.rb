require 'jwt_claims/string_or_uri'

module JwtClaims
  module Claim
    # JWT ID
    # @see https://tools.ietf.org/html/rfc7519#section-4.1.7
    module Jti

      module_function

      # @param jti [String] a unique identifier for the JWT
      # @param options [Hash] (key jti:) expected JWT ID to match with claim
      # @return [true, false] whether to reject the claim
      def reject?(jti, options = {})
        expected_jti = options.fetch(:jti, nil)
        !StringOrUri.present_and_equal?(jti, expected_jti)
      end
    end
  end
end
