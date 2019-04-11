require_relative '../lib/crypto_scrapper'


describe "the crypto_scrapper function" do
  tester = crypto_scrapper
  it "return an Hash" do
    expect(tester.class).to eq(Hash)
  end
   it "return at least 1000 currency" do
    expect(tester.length > 1000).to eq(true)
  end
  it "verify that BTC exist and has a value" do
    expect(tester["BTC"].to_f > 0).to eq(true)
  end
end

