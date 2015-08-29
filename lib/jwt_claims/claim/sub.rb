require 'jwt_claims/string_or_uri'

module JwtClaims
  module Claim
    # Subject
    # @see https://tools.ietf.org/html/rfc7519#section-4.1.2
    module Sub

      module_function

      # @param sub [String] the principal that is the subject of the JWT
      # @param options [Hash] (key sub:) expected subject to match with claim
      # @return [true, false] whether to reject the claim
      def reject?(sub, options = {})
        expected_subject = options.fetch(:sub, nil)
        !StringOrUri.present_and_equal?(sub, expected_subject)
      end
    end
  end
end
