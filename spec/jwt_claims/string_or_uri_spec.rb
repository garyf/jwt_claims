require 'jwt_claims/string_or_uri'

module JwtClaims
  describe StringOrUri do
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
    