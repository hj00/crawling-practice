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
links = text.css('div#bodyContent a').map{|link| link['href']}
# p links
before_links = links.uniq
after_link = Array.new

#안됨...이유점..index랑 each가 똑바로 안먹는듯...
#ruby에서 each랑 index공부 필요
before_links.each do |bindex|
    if(bindex.index(/:|^#|^&/))
    else
        after_link.push(bindex)
        p after_link
    end
end
    


# def get_link(t_url)
#  if(t_url.index(/^\/|^.\//))
#   t_url = $tg_url+"/"+t_url
#  end
#  puts t_url
#  page = Nokogiri::HTML(open(t_url)) 
#  after_link = Array.new()
#  before_link = page.css("a").map{|link|link['href']}  #가공 전
#  before_link = before_link.uniq  # 중복제거
#  for index in before_link # Loop!
#   if(index == nil)
#     break;
#   end
#   if(index.index(/:|^#|^&|^\/\//) != nil)
#      if(index.index(t_url) != nil)
#       after_link.push(index)
#      end
#   else
#      after_link.push(index)
#   end
#  end
#  return after_link
# end


# links = {text.css('a').text => text.css('a')[1]['href']}
# puts "#{links.keys} => #{links.values}"

#expages = {text.css('div#bodyContent a').text => text.css('div#bodyContent a')[1]['href']}
# puts expages

