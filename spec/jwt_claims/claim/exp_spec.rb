require 'jwt_claims/claim/exp'

module JwtClaims
  module Claim
    describe Exp do
      let(:after_now) { Time.now.to_i + 1 }
      describe '#reject?' do
        it 'w numeric_date after now returns false' do
          expect(Exp.reject? after_now).to be false
        end

        it 'w numeric_date now returns true' do
          expect(Exp.reject? Time.now.to_i).to be true
        end

        it 'w/o numeric numeric_date returns true' do
          expect(Exp.reject? after_now.to_s).to be true
        end
      end
    end
  end
end
    