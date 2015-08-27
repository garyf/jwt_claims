require 'jwt_claims/claim/nbf'

module JwtClaims
  module Claim
    describe Nbf do
      let(:after_now) { Time.now.to_i + 1 }
      describe '#reject?' do
        it 'w numeric_date now returns false' do
          expect(Nbf.reject? Time.now.to_i).to be false
        end
        it 'w numeric_date after now returns true' do
          expect(Nbf.reject? after_now).to be true
        end

        it 'w/o numeric claimed_time returns true' do
          expect(Nbf.reject? after_now.to_s).to be true
        end
      end
    end
  end
end
    