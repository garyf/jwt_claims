require 'jwt_claims/claim/exp'

module JwtClaims
  module Claim
    describe Exp do
      let(:after_now) { Time.now.to_i + 1 }
      context '#reject?' do
        it 'w numeric_date after now returns false' do
          expect(Exp.reject? after_now).to be false
        end

        it 'w numeric_date now returns true' do
          expect(Exp.reject? Time.now.to_i).to be true
        end

        it 'w/o numeric numeric_date returns true' do
          expect(Exp.reject? after_now.to_s).to be true
        end

        context 'w leeway' do
          let(:seconds) { 180 }
          let(:options) { {leeway_seconds: seconds} }
          it 'w numeric_date after now returns false' do
            claim = after_now - seconds
            expect(Exp.reject? claim, options).to be false
          end

          it 'w numeric_date now returns true' do
            claim = Time.now.to_i - seconds
            expect(Exp.reject? claim, options).to be true
          end
        end
      end
    end
  end
end
    