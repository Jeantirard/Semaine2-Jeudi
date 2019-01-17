require 'dotenv'
require 'pry'
require 'nokogiri'
require 'open-uri'

def get_deputy_email(deputy_url)
	page = Nokogiri::HTML(open(deputy_url))   
	page.xpath('//div[1]/div[5]/div/div[2]/div[1]/ul[2]/li[1]/ul/li[1]/a').text
	
end

def get_deputy_urls
	deputy_name =[]
	deputy_url = []
	page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))  
	page.xpath('//*[@class="list_dep jstitle phototitle block"]').each do |link|
	  deputy_name <<  link.children[3].text.delete(" ").chomp.split(",")
	  deputy_url << "https://www.nosdeputes.fr" + link.parent["href"]
	end
	return [deputy_url, deputy_name]
end


def perform 
	deputy_inf = get_deputy_urls
	url_list = deputy_inf[0]
	name_list = deputy_inf[1]
	hash_deputy = [] 

	url_list.each_with_index do |deputy_url,i|

		hash_deputy << { "first_name" => name_list[i][1],"family_name" => name_list[i][0][1..-1], "email" => get_deputy_email(deputy_url)}
		if i > 600
			return hash_deputy
		end
	end

	return hash_deputy
end

puts perform
#puts get_deputy_urls
#puts get_deputy_email("https://www.nosdeputes.fr/yves-daniel")
#binding.pry	

