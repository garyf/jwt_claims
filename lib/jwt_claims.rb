require 'json_web_token'
require 'jwt_claims/validation'

module JwtClaims

  module_function

  # @param jwt [String] JSON web token
  # @param options [Hash] expected values for certain claims;
  #   optional keys include: :aud, :iss, :jti, :sub
  # @return [Hash] { ok: { the jwt claims set hash } }, or { error: [symbols of all rejected claims] }
  def verify(jwt, options)
    hsh = JsonWebToken.verify(jwt, options)
    return {error: 'invalid JWT'} if hsh[:error]
    claims = hsh[:ok]
    return {error: 'invalid input'} unless claims
    verified(claims, options)
  end

  def verified(claims, options)
    rejected_claims = Validation.rejected(claims, options)
    return {ok: claims} if rejected_claims.empty?
    {error: rejected_claims}
  end
end
