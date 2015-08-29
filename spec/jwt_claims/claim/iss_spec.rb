require 'jwt_claims/claim/iss'

module JwtClaims
  module Claim
    describe Iss do
      context '#reject?' do
        let(:issuer) { 'issuer' }
        describe 'w an :iss claim' do
          let(:iss) { issuer }
          it 'w match returns false' do
            expect(Iss.reject? iss, {iss: issuer}).to be false
          end

          it 'w/o match returns true' do
            expect(Iss.reject? iss, {iss: 'not issuer'}).to be true
          end

          it 'w/o options[:iss] returns true' do
            expect(Iss.reject? iss, {aud: 'issuer'}).to be true
          end
        end

        it 'w a blank :iss claim returns true' do
          expect(Iss.reject? '', {iss: issuer}).to be true
        end
      end
    end
  end
end
    