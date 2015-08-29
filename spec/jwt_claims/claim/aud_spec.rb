require 'jwt_claims/claim/aud'

module JwtClaims
  module Claim
    describe Aud do
      context '#reject?' do
        context 'w :aud claim an array' do
          let(:recipient) { 'recipient' }
          let(:uri) { 'http://www.example.com' }
          let(:aud) { [uri, recipient] }
          describe 'w match' do
            it 'string returns false' do
              expect(Aud.reject? aud, {aud: recipient}).to be false
            end

            it 'uri returns false' do
              expect(Aud.reject? aud, {aud: uri}).to be false
            end
          end

          it 'w/o match returns true' do
            expect(Aud.reject? aud, {aud: 'not recipient'}).to be true
          end

          it 'w/o options[:aud] returns true' do
            expect(Aud.reject? aud, {iss: 'recipient'}).to be true
          end
        end

        describe 'w :aud claim a string' do
          let(:recipient) { 'recipient' }
          let(:aud) { recipient }
          it 'w match returns false' do
            expect(Aud.reject? aud, {aud: recipient}).to be false
          end

          it 'w/o match returns true' do
            expect(Aud.reject? aud, {aud: 'not recipient'}).to be true
          end

          it 'w/o options[:aud] returns true' do
            expect(Aud.reject? aud, {iss: 'recipient'}).to be true
          end
        end

        shared_examples_for 'a blank :aud claim' do
          let(:options) { {aud: 'recipient'} }
          it 'returns true' do
            expect(Aud.reject? aud, options).to be true
          end
        end

        describe 'w :aud an empty array' do
          let(:aud) { [] }
          it_behaves_like 'a blank :aud claim'
        end

        describe 'w :aud an array w an empty string' do
          let(:aud) { [''] }
          it_behaves_like 'a blank :aud claim'
        end

        describe 'w :aud an empty string' do
          let(:aud) { '' }
          it_behaves_like 'a blank :aud claim'
        end

        describe 'w options[:aud] an empty string' do
          let(:aud) { 'recipient' }
          let(:options) { {aud: ''} }
          it 'returns truthy' do
            expect(Aud.reject? aud, options).to be true
          end
        end
      end
    end
  end
end
    