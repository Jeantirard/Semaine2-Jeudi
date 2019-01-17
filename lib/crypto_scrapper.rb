require 'dotenv'
require 'pry'
require 'nokogiri'
require 'open-uri'

def crypto 
	curr_price =  Array.new
	curr_name =  Array.new
	curr_hash =  Array.new

	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
	page.xpath('//tbody//td[3]').each do |node|
	  curr_name << node.text
	end

	page.xpath('//tbody//td[5]/a').each do |node|
	  curr_price << node.text[1..-1].to_f
	end

	curr_name.size.times do |i|
		curr_hash << {curr_name[i] => curr_price[i]}
	end


	#puts curr_hash["BTC"]
	return curr_hash
end

puts crypto

=begin
require_relative ''

binding.pry
page = Nokogiri::HTML(open("http://en.wikipedia.org/"))   
puts page.class   # => Nokogiri::HTML::Document
puts page.css("title")[0].name   # => title
puts page.css("title")[0].text   # => My webpage

links = page.css("a")
puts links.length   # => 6
puts links[6].text   # => Click here
puts links[6]["href"] # => http://www.google.com

news_links = page.css("a").select{|link| link['data-category'] == "news"}
news_links.each{|link| puts link['href'] }

news_links = page.css("a[data-category=news]")
news_links.each{|link| puts link['href']}
#=>   http://reddit.com
#=>   http://www.nytimes.com

puts news_links.class   #=>   Nokogiri::XML::NodeSet         
puts page.css('p').css("a").css("strong")
page.xpath('//p/a').each do |node|
  price << node.text
end
	
doc = Nokogiri::HTML(open("http://www.google.com/search?q=doughnuts"))
doc.css('h3.r > a.l').each do |node|
  puts node.text
end
=end