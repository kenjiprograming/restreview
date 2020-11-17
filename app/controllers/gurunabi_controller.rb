class GurunabiController < ApplicationController

  def hoge
    hairetu = {
      keyid: "8ad6930f6b2218d7e5a2c9447bef848e",
      hit_per_page: 100,
      name: params[:name]
    }

    require 'net/http'
    require 'uri'
    require 'json'

    params = URI.encode_www_form(hairetu)
    uri = URI.parse("https://api.gnavi.co.jp/RestSearchAPI/v3?#{params}")
    response = Net::HTTP.get_response(uri)
    result = JSON.parse(response.body)
    
    @num = 0
    @long = result["rest"].length
    @restaurants = {}

    while @num < @long do
      @restaurants[@num] = result["rest"][@num]
      @num += 1
    end
    @num = 0

  end

  def search

    hairetu = {
      keyid: "8ad6930f6b2218d7e5a2c9447bef848e",
      hit_per_page: 100,
      name: params[:name]
    }

    require 'net/http'
    require 'uri'
    require 'json'

    params = URI.encode_www_form(hairetu)
    uri = URI.parse("https://api.gnavi.co.jp/RestSearchAPI/v3?#{params}")
    json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを叩く
    result = JSON.parse(json) #返ってきたjsonデータをrubyの配列に変換

    unless result["rest"]
      redirect_to gurunabi_search_path
      return
      # binding.pry
    end
    
    long = result["rest"].length
    num = 0

    while num < long do
      rest_name = result["rest"][num]["name"]
      rest_address = result["rest"][num]["address"]
      rest_url = result["rest"][num]["url"]
      rest = Rest.new(name: rest_name, address: rest_address, url: rest_url)
      unless Rest.find_by(name: rest.name).present?
        rest.save
      end
      num += 1
    end

    num = 0
    @restaurants = Rest.where("name LIKE ?", "%#{hairetu[:name]}%")
  end

  def show
    @rest = Rest.find(params[:id])
    @posted = Posted.new
  end

  def create
    rest = Rest.find(params[:id])
    # @posted = Posted.new(name: rest.name, address: rest.address, url: rest.url)
    @posted = current_user.posteds.new(name: rest.name, address: rest.address, url: rest.url, caption: params[:caption])
    if @posted.save
      redirect_to root_path
    else
      render :show
    end
  end

end
