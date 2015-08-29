require 'jwt_claims/string_or_uri'

module JwtClaims
  describe StringOrUri do
    context '#present_and_equal?' do
      it 'w equality, returns true' do
        expect(StringOrUri.present_and_equal? 'foo', 'foo').to be true
      end

      shared_examples_for 'a blank value or not equal' do
        it 'returns false' do
          expect(StringOrUri.present_and_equal? a, b).to be false
        end
      end

      describe 'w 1st argument blank' do
        let(:a) { '' }
        let(:b) { 'bar' }
        it_behaves_like 'a blank value or not equal'
      end

      describe 'w 2nd argument blank' do
        let(:a) { 'foo' }
        let(:b) { '' }
        it_behaves_like 'a blank value or not equal'
      end

      describe 'w/o equality' do
        let(:a) { 'foo' }
        let(:b) { 'bar' }
        it_behaves_like 'a blank value or not equal'
      end
    end

    describe '#blank?' do
      it 'classifies nil, empty, or exclusively whitespace strings' do
        expect(StringOrUri.blank? nil).to be true
        expect(StringOrUri.blank? '').to be true
        expect(StringOrUri.blank? '   ').to be true
        expect(StringOrUri.blank? "\t\n\r").to be true

        expect(StringOrUri.blank? 'foo').to be false
        expect(StringOrUri.blank? 'bar ').to be false
      end
    end
  end
end
    