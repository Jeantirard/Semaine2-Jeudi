require 'dotenv'
require 'pry'
require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url7)

end

def get_townhall_urls
	town_name = []
	town_url = []
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))   
	page.xpath('/html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/p[2]/object/table/tbody/tr[2]/td/table//a').each do |node|
	  town_name << node.text
	  town_url << node["href"]
	end
end
a=5
binding.pry	
puts a+=6
#puts get_townhall_urls
