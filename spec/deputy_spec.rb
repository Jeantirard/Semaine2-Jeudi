require_relative '../lib/deputy.rb'
describe "cherche les urls des pages des députés" do
  it "trouver l'url des 577 députés" do
    expect(get_deputy_urls[1].size).to eq(577)
  end
end

describe "cherche les emails des députés" do
  it "trouver l'email d'un député" do
    expect(get_deputy_email("https://www.nosdeputes.fr/berangere-abba")).to eq("berangere.abba@assemblee-nationale.fr")
  end
end