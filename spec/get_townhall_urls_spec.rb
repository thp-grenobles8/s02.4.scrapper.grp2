require_relative '../lib/get_townhall_urls'


describe "the get_townhall_urls function" do
  tester = get_townhall_urls
  it "return an Hash" do
    expect(tester.class).to eq(Hash)
  end
   it "return at least 100 cities" do
    expect(tester.length > 100).to eq(true)
  end
  it "verify that BEAUCHAMP exist" do
    expect(tester.select {|k , v| k.match("BEAUCHAMP")}).to eq({"BEAUCHAMP"=>"accueil-mairie@ville-beauchamp.fr"})
  end
end

