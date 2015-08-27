require 'jwt_claims/string_or_uri'

module JwtClaims
  module Claim
    # Audience
    # @see https://tools.ietf.org/html/rfc7519#section-4.1.3
    module Aud

      module_function

      # @param aud [Array, String] the intended recipients of the JWT
      # @param options [Hash] (key aud:) expected audience (or recipient) to match with claim
      # @return [true, false] whether to reject the claim
      def reject?(aud, options = {})
        audience = aud.is_a?(Array) ? aud : [aud]
        expected_recipient = options.fetch(:aud, nil)
        !present_and_member?(audience, expected_recipient)
      end

      def present_and_member?(collection, value)
        StringOrUri.present?(value) &&
          collection.include?(value)
      end

      private_class_method :present_and_member?
    end
  end
end
