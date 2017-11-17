require 'rest-client'
require 'json'

# daum webtoon crawling
# url = "http://webtoon.daum.net/data/pc/webtoon/list_daily_ranking/finished?timeStamp=1510902688338"
# result = RestClient.get(url)
# result = JSON.parse(result)
# p result

# p result.keys
# p result['data'].keys # undefined metho -> 왜냐하면 hash가 아니기 때문

# result['data'].each do |data|
#     # puts data.keys
#     artist = data["cartoon"]["artists"].collect {|artist| artist["name"]}
#     # puts artist
#     title = data["title"]
#     # puts title
#     score = data["averageScore"].round(1)
#     image_url = data["appThumbnailImage"]["url"]
#     # puts image_url
#     puts "#{title}(#{artist}) / #{score} 점, image: #{image_url}"
# end

# 왓챠 플레이 크롤링(세션/쿠키 이용)
# url = "https://watcha.net/boxoffice.json?page=1&per=19"

# headers = {
#     cookie: "__uvt=; _s_guit=94029de85265a1adb5641a12eee846abf68f85633bdfb57e72b6bf4a6dd0; uvts=6m4WcCF3lLBbC8mz; _gat=1; _guinness_session=dFVzYWVOc2RkU21uUndZbHFQS3NSU2pJeGtENzlMQ00ybk02ejZOaVhEa0hpM2V2Z2ovSks2dEFudzBBMForV0tPVHZuc1hzZjdJSmloLzhtT0NqME9aU1NjZlZYSjNtTnkwUlpGeEFrWVpwT2pFYXdqbDgwcjd3THh5V1cxWEJIQ3FSRVBXU29jb3NXMml1R3pJc0p6dHBKWHNOL0tDSnIwamFvejhLMlpjTzRBMDNwQlZTbnd6Y3pxUzljVFZhLS1xejRpcGd4NkxzMXpHSkEwOUpGTlVnPT0%3D--a764d06dc3e137543049a2e37962188f4eb7645f; _ga=GA1.2.290445583.1510902299; _gid=GA1.2.1876661750.1510902299"
# }
# res = RestClient.get(url, headers)
# # puts res
# res = JSON.parse(res)
# puts res

# 멜론티켓 (POST방식의 경우)
url = "http://ticket.melon.com/csoon/ajax/listTicketOpen.htm"
params = { # F12 > Network > Xhr > list.... > Headers > Form Data
    orderType: 0,
    pageIndex: 1,
    schText: ""
} # parameter 바꿔가면서 놀아보기

puts RestClient.post(url, params)