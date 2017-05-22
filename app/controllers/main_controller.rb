class MainController < ApplicationController
    def index
        require 'open-uri'
        require 'json'
        page = open("http://www.nlotto.co.kr/common.do?method=getLottoNumber")
        
        lotto_read = page.read 
        
        lotto_json = JSON.parse(lotto_read)
        @lotto_number = [ lotto_json["drwtNo1"], lotto_json["drwtNo2"], lotto_json["drwtNo3"], lotto_json["drwtNo4"], lotto_json["drwtNo5"], lotto_json["drwtNo6"]]
        @bonus_number = lotto_json["bnusNo"]
        
    end
    
    def show
        
        @input_number = []
        
        require 'open-uri'
        require 'json'
        page = open("http://www.nlotto.co.kr/common.do?method=getLottoNumber")
        
        lotto_read = page.read 
        
        lotto_json = JSON.parse(lotto_read)
        @lotto_number = [ lotto_json["drwtNo1"], lotto_json["drwtNo2"], lotto_json["drwtNo3"], lotto_json["drwtNo4"], lotto_json["drwtNo5"], lotto_json["drwtNo6"]]
        @bonus_number = lotto_json["bnusNo"]
        
        
        
        all = []
        for i in 1..45
        all.push(i)
        end
        
        @input_number1 = params[:input1]
        @input_number2 = params[:input2]
        @input_number3 = params[:input3]
        @input_number4 = params[:input4]
        @input_number5 = params[:input5]
        @input_number6 = params[:input6]
        
        
        @input_number= [ @input_number1 = params[:input1].to_i,
                        @input_number2 = params[:input2].to_i,
                        @input_number3 = params[:input3].to_i,
                        @input_number4 = params[:input4].to_i,
                        @input_number5 = params[:input5].to_i,
                        @input_number6 = params[:input6].to_i ]
        
        
        
        @count1=0
        @count2=0
        for i in 0..5
          for j in 0..5
            if @lotto_number[i] == @input_number[j]
                @count1+=1
            end
          end
        end
        
        for i in 0..5 
          if @input_number[i] == @bonus_number
              @count2+=1
          end
        end
        
 
        
      
        
        
        if @count1 ==3
            @result= "5등"
        elsif @count1 <3
           @result= "꽝"
        elsif @count1 == 4
            @result= "4등"
        elsif @count1 == 5
          if @count2 == 0
              @result= "3등"
          else @count2 == 1
              @result= "2등"
          end
        elsif @count1 == 6
           @result= "1등"
        end
       
    end
    
    def result
    
    end
    
end
