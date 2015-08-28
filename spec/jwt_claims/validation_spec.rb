require 'jwt_claims/validation'

module JwtClaims
  describe Validation do
    context 'example data' do
      let(:uri) { 'http://www.example.com' }
      let(:recipient) { 'recipient' }
      let(:aud) { [uri, recipient] }

      let(:after_now) { Time.now.to_i + 1 }
      let(:before_now) { Time.now.to_i - 1 }

      let(:default_options) do
        {
          aud: uri
        }
      end
      let(:default_claims) do
        {
          aud: [uri, recipient],
          exp: after_now,
          iat: before_now,
          nbf: before_now
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
              nbf: after_now
            }
          end
          it 'returns array of failed claims' do
            expect(Validation.rejected invalid_claims, default_options)
              .to include(
                :aud,
                :exp,
                :iat,
                :nbf
              )
          end
        end
      end
    end
  end
end
