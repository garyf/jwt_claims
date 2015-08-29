require 'jwt_claims/claim/sub'

module JwtClaims
  module Claim
    describe Sub do
      context '#reject?' do
        let(:subject) { 'subject' }
        describe 'w a :sub claim' do
          let(:sub) { subject }
          it 'w match returns false' do
            expect(Sub.reject? sub, {sub: subject}).to be false
          end

          it 'w/o match returns true' do
            expect(Sub.reject? sub, {sub: 'not subject'}).to be true
          end

          it 'w/o options[:sub] returns true' do
            expect(Sub.reject? sub, {aud: subject}).to be true
          end
        end

        it 'w a blank :sub claim returns true' do
          expect(Sub.reject? '', {sub: subject}).to be true
        end
      end
    end
  end
end
    