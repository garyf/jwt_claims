module JwtClaims
  # Validate registered claims
  # @see http://tools.ietf.org/html/rfc7519#section-4.1
  module Validation

    module_function

    # @param claims [Hash] JWT claims
    # @param options [Hash] expected values for certain claims
    # @return [Array] symbols of the registered claims that fail validation
    def rejected(claims, options = {})
      claims.each_with_object([]) do |claim, memo|
        sym = reject(*claim, options)
        memo << sym if sym
      end
    end

    def reject(key, val, options)
      return unless reg_claim = registered_claim(key)
      key if reg_claim.reject?(val, options)
    end

    def registered_claim(sym)
      case sym
      when :aud then Claim::Aud
      when :exp then Claim::Exp
      else nil # custom claim
      end
    end

    private_class_method :reject,
      :registered_claim
  end
end
