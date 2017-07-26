class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params[:search]},25))?format=json&show=storeType,longName,city,distance,phone&apiKey=#{ENV['best_buy_api_key']}")
    @stores = JSON.parse(response.body)
    binding.pry
  end
end
