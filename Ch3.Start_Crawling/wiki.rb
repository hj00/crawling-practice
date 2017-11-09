require 'httparty'
require 'nokogiri'
require 'mechanize'

url = "http://en.wikipedia.org/wiki/Kevin_Bacon"

# agent = Mechanize.new
# html = agent.get(url)
# # html.links.each {|link| puts "#{link.text} => #{link.href}"}
# html.links.each do |link| 
#     links = {link.text => link.href}
#     puts links
# end

response = HTTParty.get(url)
text = Nokogiri::HTML(response.body)
# puts text.class
# puts text.css('a').text
# puts text.css('a')[1]['href']

links = {text.css('a').text => text.css('a')[1]['href']}
puts "#{links.keys} => #{links.values}"

expages = {text.css('div#bodyContent a').text => text.css('div#bodyContent a')[1]['href']}
# puts expages

