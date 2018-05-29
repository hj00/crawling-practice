## Scrapping

```ruby
# daum webtoon crawling
url = "http://webtoon.daum.net/data/pc/webtoon/list_daily_ranking/finished?timeStamp=1510902688338"
result = RestClient.get(url)
result = JSON.parse(result)
p result

p result.keys
p result['data'].keys # undefined metho -> 왜냐하면 hash가 아니기 때문

result['data'].each do |data|
    # puts data.keys
    artist = data["cartoon"]["artists"].collect {|artist| artist["name"]}
    # puts artist
    title = data["title"]
    # puts title
    score = data["averageScore"].round(1)
    image_url = data["appThumbnailImage"]["url"]
    # puts image_url
    puts "#{title}(#{artist}) / #{score} 점, image: #{image_url}"
end
```

- MEAN(Ex Angular Node.js) / MERN stack


- refactoring(중복되는 코드를 최대한 줄이고 정리)
  - 재사용 용이
  - 유지/보수 용이

```ruby
class Crawler
  def self.html(url, action, params)
    Nokogiri::HTML(send_request(action, url, params))
  end
  
  def self.json(url, action, params)
    JSON.parse(send_request(action, url, params))
  end
  
  private
  def self.send_request(action, url, params)
    RestClient.send(action, url, params)
  end
end
```

- Session

```ruby
url = "https://watcha.net/boxoffice.json?page=1&per=19"

headers = {
    cookie: "__uvt=; _s_guit=94029de85265a1adb5641a12eee846abf68f85633bdfb57e72b6bf4a6dd0; uvts=6m4WcCF3lLBbC8mz; _gat=1; _guinness_session=dFVzYWVOc2RkU21uUndZbHFQS3NSU2pJeGtENzlMQ00ybk02ejZOaVhEa0hpM2V2Z2ovSks2dEFudzBBMForV0tPVHZuc1hzZjdJSmloLzhtT0NqME9aU1NjZlZYSjNtTnkwUlpGeEFrWVpwT2pFYXdqbDgwcjd3THh5V1cxWEJIQ3FSRVBXU29jb3NXMml1R3pJc0p6dHBKWHNOL0tDSnIwamFvejhLMlpjTzRBMDNwQlZTbnd6Y3pxUzljVFZhLS1xejRpcGd4NkxzMXpHSkEwOUpGTlVnPT0%3D--a764d06dc3e137543049a2e37962188f4eb7645f; _ga=GA1.2.290445583.1510902299; _gid=GA1.2.1876661750.1510902299"
}
res = RestClient.get(url, headers)
# puts res
res = JSON.parse(res)
puts res
```

- 크롤링 시 고려사항
  - Requrest URL
  - Method
  - Query String
  - Form Data
  - Site 구성
  - User-Agent 확인
  - 'naver' 크롤링이 안될 경우 -> POST방식으로 바꾸어서 넘겨 볼 것 

```ruby
# 멜론티켓 (POST방식의 경우)
url = "http://ticket.melon.com/csoon/ajax/listTicketOpen.htm"
params = { # F12 > Network > Xhr > list.... > Headers > Form Data
    orderType: 0,
    pageIndex: 1,
    schText: ""
} # parameter 바꿔가면서 놀아보기

puts RestClient.post(url, params)
```

