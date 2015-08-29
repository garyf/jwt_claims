require 'jwt_claims/claim/jti'

module JwtClaims
  module Claim
    describe Jti do
      context '#reject?' do
        let(:jwt_id) { 'jwt_id' }
        describe 'w a :jti claim' do
          let(:jti) { jwt_id }
          it 'w match returns false' do
            expect(Jti.reject? jti, {jti: jwt_id}).to be false
          end

          it 'w/o match returns true' do
            expect(Jti.reject? jti, {jti: 'not jwt_id'}).to be true
          end

          it 'w/o options[:jti] returns true' do
            expect(Jti.reject? jti, {aud: jwt_id}).to be true
          end
        end

        it 'w a blank :jti claim returns true' do
          expect(Jti.reject? '', {jti: jwt_id}).to be true
        end
      end
    end
  end
end
    