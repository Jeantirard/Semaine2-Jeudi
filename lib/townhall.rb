require 'dotenv'
require 'pry'
require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)
	page = Nokogiri::HTML(open(townhall_url))   
	page.xpath('//div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

def get_townhall_urls
	town_name =[]
	town_url = []
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))   
	page.xpath('//a[@class="lientxt"]').each do |link|
	  town_name <<  link.text
	  town_url << "http://annuaire-des-mairies.com" + link["href"][1..-1]
	end
	return [town_url, town_name]
end


def perform 
	townhall_inf = get_townhall_urls
	url_list = townhall_inf[0]
	name_list = townhall_inf[1]
	hash_townhall = Hash.new 

	url_list.each_with_index do |townhall_url,i|
	hash_townhall[name_list[i]] = get_townhall_email(townhall_url)
	end

	return hash_townhall
end

puts perform
#binding.pry	

puts get_townhall_email("http://annuaire-des-mairies.com/95/ableiges.html")
#puts get_townhall_urls