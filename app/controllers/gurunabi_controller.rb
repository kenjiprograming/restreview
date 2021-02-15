class GurunabiController < ApplicationController
  before_action :authenticate_user!
  
  def search
    hairetu = {
      keyid: "7aafccaea5381a783d161654c70a5969",
      hit_per_page: 50,
      name: params[:name],
      freeword: params[:freeword]
    }

    require 'net/http'
    require 'uri'
    require 'json'

    params = URI.encode_www_form(hairetu)
    uri = URI.parse("https://api.gnavi.co.jp/RestSearchAPI/v3/?#{params}")
    json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを叩く
    result = JSON.parse(json) #返ってきたjsonデータをrubyの配列に変換

    # unless result["rest"]
    #   render :search
    #   # return
    #   # binding.pry
    # end
    # binding.pry
    unless result["error"].present?
      # binding.pry
      long = result["rest"].length
      num = 0
      while num < long do
        rest_name = result["rest"][num]["name"]
        rest_address = result["rest"][num]["address"]
        rest_url = result["rest"][num]["url"]
        rest_tel = result["rest"][num]["tel"]
        rest_opentime = result["rest"][num]["opentime"]
        rest_holiday = result["rest"][num]["holiday"]
        rest_budget = result["rest"][num]["budget"]
        rest = Rest.new(name: rest_name, address: rest_address, url: rest_url, tel: rest_tel, opentime: rest_opentime, holiday: rest_holiday, budget: rest_budget)
        # binding.pry
        unless Rest.find_by(name: rest.name)
          rest.save
        end
        num += 1
      end
  
      num = 0
      
      # binding.pry
      if hairetu[:name] && hairetu[:freeword]
        @restaurants = Rest.where("name LIKE ?", "%#{ hairetu[:name] }%").where("address LIKE ?", "%#{ hairetu[:freeword] }%")
        flash[:notice] = "検索結果が#{@restaurants.length}件ありました。"
      end
      
    else
      @restaurant = Rest.new
      flash[:alert] = "検索結果がありませんでした。"
      redirect_to gurunabi_search_path
    end
  end


  def show
    @rest = Rest.find(params[:id])
    @want = Want.new
    # binding.pry
  end
end


# if hairetu[:freeword]
#   str = hairetu[:freeword].split(/[[:blank:]]/)
#   @restaurants = Rest.where("name LIKE ?", "%#{str[0]}%" "%#{str[1]}%").or(Rest.where("name LIKE ?", "%#{str[1]}%" "%#{str[0]}%"))
#   flash[:notice] = "検索結果が#{@restaurants.length}件ありました。"
#   # return
# else
#   flash[:alert] = "検索結果がありませんでした。"
#   @restaurant = Rest.new
# end