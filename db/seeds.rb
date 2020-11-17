# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'net/http'
require 'uri'
require 'json'

uri = URI.encode('https://api.gnavi.co.jp/RestSearchAPI/v3?keyid=8ad6930f6b2218d7e5a2c9447bef848e&hit_per_page=100&name=鳥貴族')
uri = URI.parse(uri)
json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを叩く
result = JSON.parse(json) #返ってきたjsonデータをrubyの配列に変換

num = 0
long = result["rest"].length
while num < long do
  name = result["rest"][num]["name"]
  address = result["rest"][num]["address"]
  url = result["rest"][num]["url"]
  Rest.create(name: name, address: address, url: url)
  num += 1
end
num = 0
