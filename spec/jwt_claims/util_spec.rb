require 'jwt_claims/util'

module JwtClaims
  describe Util do
    describe '#leeway_seconds' do
      it "returns a value between 0 and #{Util::LEEWAY_SECONDS_MAX}" do
        expect(Util.leeway_seconds 0).to eql 0
        expect(Util.leeway_seconds 180).to eql 180
        expect(Util.leeway_seconds 1.5).to eql 1.5
        expect(Util.leeway_seconds 181).to eql 0
        expect(Util.leeway_seconds -1).to eql 0
        expect(Util.leeway_seconds 'foo').to eql 0
      end
    end
  end
end
