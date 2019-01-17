require_relative '../lib/crypto_scrapper.rb'
describe "retrouve les crypto et leurs valeurs" do
  it "retrouve les 2109 monnaies" do
    expect(crypto.size).to eq(2109)
  end
end