require_relative '../lib/get_deputy_urls'


describe "the crypto_scrapper function" do
  tester = get_deputy_urls
  it "return an Hash" do
    expect(tester.class).to eq(Hash)
  end
   it "return at least 500 deputies" do
    expect(tester.length > 500).to eq(true)
  end
  it "verify that M. Joachim Son-Forget exist and has a value" do
    expect(tester.select {|k, v| k.match("M. Joachim Son-Forget")}).to eq({"M. Joachim Son-Forget"=>"joachim.son-forget@assemblee-nationale.fr"})
  end
end

