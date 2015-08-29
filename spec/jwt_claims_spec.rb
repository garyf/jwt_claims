require 'jwt_claims'

describe JwtClaims do
  let(:after_now) { Time.now.to_i + 1 }
  let(:before_now) { Time.now.to_i - 1 }
  context '#verify' do
    describe 'JsonWebToken integration w :exp claim before now' do
      let(:jwt_w_exp_before_now_w_iss_joe) do
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJqb2UiLCJodHRwOi8vZXhhbXBsZS5jb20vaXNfcm9vdCI6dHJ1ZSwiZXhwIjoxMzAwODE5MzgwfQ.Ktfu3EdLz0SpuTIMpMoRZMtZsCATWJHeDEBGrsZE6LI"
      end
      let(:hs256_key) { "gZH75aKtMN3Yj0iPS4hcgUuTwjAzZr9C" }
      it 'w :iss claim matching' do
        options = {iss: 'joe', key: hs256_key}
        rejected_claims = JwtClaims.verify(jwt_w_exp_before_now_w_iss_joe, options)[:error]
        expect(rejected_claims.length).to eql 1
        expect(rejected_claims).to include(:exp)
      end

      it 'w/o :iss claim matching' do
        options = {iss: 'mary', key: hs256_key}
        rejected_claims = JwtClaims.verify(jwt_w_exp_before_now_w_iss_joe, options)[:error]
        expect(rejected_claims.length).to eql 2
        expect(rejected_claims).to include(:exp, :iss)
      end
    end

    describe 'w invalid JWT' do
      let(:invalid_jwt) do
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJqb2UiLCJodHRwOi8vZXhhbXBsZS5jb20vaXNfcm9vdCI6dHJ1ZSwiZXhwIjoxMzAwODE5MzgwfQ.Ktfu3EdLz0SpuTIMpMoRZMtZsCATWJHeDEBGrsZE6LX"
      end
      it 'returns error' do
        options = {exp: after_now}
        error = JwtClaims.verify(invalid_jwt, options)[:error]
        expect(error).to eql 'invalid JWT'
      end
    end
  end

  describe '#verified' do
    it 'w rejected_claims' do
      claims = {exp: before_now}
      expect(JwtClaims.verified claims, {}).to include(error: [:exp])
    end

    it 'w/o rejected_claims' do
      claims = {exp: after_now}
      expect(JwtClaims.verified claims, {}).to include(ok: claims)
    end
  end
end
