require 'jwt_claims/validation'

module JwtClaims
  describe Validation do
    context 'example data' do
      let(:uri) { 'http://www.example.com' }
      let(:recipient) { 'recipient' }
      let(:aud) { [uri, recipient] }

      let(:after_now) { Time.now.to_i + 1 }
      let(:before_now) { Time.now.to_i - 1 }

      let(:issuer) { 'issuer' }
      let(:jwt_id) { 'jwt_id' }
      let(:subject) { 'subject' }

      let(:default_options) do
        {
          aud: uri,
          iss: issuer,
          jti: jwt_id,
          sub: subject
        }
      end
      let(:default_claims) do
        {
          aud: [uri, recipient],
          exp: after_now,
          iat: before_now,
          iss: issuer,
          jti: jwt_id,
          nbf: before_now,
          sub: subject
        }
      end
      context '#rejected' do
        it 'w valid claims, returns empty array' do
          expect(Validation.rejected default_claims, default_options).to eql []
        end

        describe 'w all registered claims invalid' do
          let(:invalid_claims) do
            {
              aud: ['http://www.other.com', 'other recipient'],
              exp: before_now,
              iat: after_now,
              iss: 'other issuer',
              jti: 'other jwt_id',
              nbf: after_now,
              sub: 'other subject'
            }
          end
          it 'returns array of failed claims' do
            expect(Validation.rejected invalid_claims, default_options)
              .to include(
                :aud,
                :exp,
                :iat,
                :iss,
                :jti,
                :nbf,
                :sub
              )
          end
        end
      end
    end
  end
end
