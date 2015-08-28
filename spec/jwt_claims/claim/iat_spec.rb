require 'jwt_claims/claim/iat'

module JwtClaims
  module Claim
    describe Iat do
      let(:before_now) { Time.now.to_i - 1 }
      describe '#reject?' do
        it 'w numeric_date now returns false' do
          expect(Iat.reject? before_now).to be false
        end

        it 'w numeric_date now returns true' do
          expect(Iat.reject? Time.now.to_i).to be true
        end

        it 'w/o numeric claimed_time returns true' do
          expect(Iat.reject? before_now.to_s).to be true
        end
      end
    end
  end
end
    