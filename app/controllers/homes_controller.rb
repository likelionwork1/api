class HomesController < ApplicationController
  def index
  end

  def bithumb
    @currency = params[:currency]
    url = "https://api.bithumb.com/public/ticker/#{@currency}"
    response = HTTParty.get(url)
    @data = response.parsed_response

  end
  
  def check_status(status)
    if status > 0 and status <= 30
      status = "좋음"
    elsif status > 30 and status <= 80
      status = "보통"
    elsif status > 80 and status <= 150
      status = "나쁨"
    elsif status > 150
      status = "매우나쁨"
    else
      status = "표기불가"
    end
    
    return status
  end
  helper_method :check_status
  
  def misae
    city = params[:city].encode!('UTF-8')
    key = ENV["OPEN_API_KEY"]
    url = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst?sidoName=#{URI.escape(city)}&searchCondition=DAILY&pageNo=1&numOfRows=10&ServiceKey=#{key}&_returnType=json"
    response = HTTParty.get(url)
    data = response.parsed_response
    @data = JSON.parse(data)
    @data1 = @data['list']
    
  end
end
