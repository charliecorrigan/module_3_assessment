class SearchController < ApplicationController
  def index
    @stores = Store.fetch_stores_by_zip(params[:search])
    # response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params[:search]},25))?format=json&show=storeType,longName,city,distance,phone&apiKey=#{ENV['best_buy_api_key']}")
    # @stores = JSON.parse(response.body)
  end
end
