require 'jwt_claims/validation'

module JwtClaims
  describe Validation do
    context 'example data' do
      let(:after_now) { Time.now.to_i + 1 }
      let(:before_now) { Time.now.to_i - 1 }

      let(:default_options) { {} }
      let(:default_claims) do
        {
          exp: after_now
        }
      end
      context '#rejected' do
        it 'w valid claims, returns empty array' do
          expect(Validation.rejected default_claims, default_options).to eql []
        end

        describe 'w all registered claims invalid' do
          let(:invalid_claims) do
            {
              exp: before_now
            }
          end
          it 'returns array of failed claims' do
            expect(Validation.rejected invalid_claims, default_options)
              .to include(
                :exp
              )
          end
        end
      end
    end
  end
end
