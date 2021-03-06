# JWT Claims [![travis][ci_img]][travis] [![yard docs][yd_img]][yard_docs] [![code climate][cc_img]][code_climate]

## Verification of a JWT (JSON Web Token) Claims Set for Ruby

### Description

A Ruby implementation of the JSON Web Token (JWT) registered claims, [RFC 7519][rfc7519]

## Installation
    gem install jwt_claims

## Usage

### JwtClaims.verify(jwt, options)

Returns a hash, either:
* \{:ok, claims\}, a JWT claims set hash, if the JWT Message Authentication Code (MAC), or signature, is verified and the registered claims are also verified
* \{:error, [rejected_claims]\}, a list of any registered claims that fail validation, if the JWT MAC is verified
* \{:error, 'invalid JWT'\} if the JWT MAC is not verified
* \{:error, 'invalid input'\} otherwise

`jwt` (required) is a JSON web token string

`options` (required) hash

* **alg** (optional, default: `'HS256'`)
* **key** (required unless alg is 'none')

Please refer to the [JSON Web Token][json_web_token] gem for additional guidance regarding JWT options

Example

```ruby
# An example using the 'Expires' `exp` claim (10 years for this example).
> jwt = JsonWebToken.sign({foo: 'bar', exp: Time.now.to_i + 315360000}, key: 'gZH75aKtMN3Yj0iPS4hcgUuTwjAzZr9C')
#=> "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmb28iOiJiYXIiLCJleHAiOjE3OTEyMjc1MTl9.7cT7PzsT8Jv0VQIxokjk3sUqzJCxBR4h3W2uACQ-tW0"

# Verify with default algorithm, HMAC SHA256
# Returns a hash of `{:ok, verified_claims}`
> JwtClaims.verify(jwt, key: 'gZH75aKtMN3Yj0iPS4hcgUuTwjAzZr9C')
#=> {:ok=>{:foo=>"bar", :exp=>1475870843}}
```

### Supported registered claims

JWT claim | key | a valid claim value must
---|---|---
Issuer | :iss | equal options[:iss] 
Subject | :sub |  equal options[:sub]
Audience | :aud |  include options[:aud]
Expiration Time | :exp | be > current time
Not Before | :nbf | be <= current time
Issued at | :iat | be < current time
JWT ID | :jti | equal options[:jti]

Additional detail about JWT registered claims is found in [this section][registered_claim_names] of the JWT RFC

### Supported Ruby versions
Ruby 2.0.0 and up

[rfc7519]: http://tools.ietf.org/html/rfc7519
[json_web_token]: https://github.com/garyf/json_web_token
[registered_claim_names]: http://tools.ietf.org/html/rfc7519#section-4.1

[travis]: https://travis-ci.org/garyf/jwt_claims
[ci_img]: https://travis-ci.org/garyf/jwt_claims.svg?branch=master
[yard_docs]: http://www.rubydoc.info/github/garyf/jwt_claims
[yd_img]: http://img.shields.io/badge/yard-docs-blue.svg
[code_climate]: https://codeclimate.com/github/garyf/jwt_claims
[cc_img]: https://codeclimate.com/github/garyf/jwt_claims/badges/gpa.svg
