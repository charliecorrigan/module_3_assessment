class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeType,longName,city,distance,phone&apiKey=7a3heu7emrjz6qbsugmepbv6")
    binding.pry
    @stores = response
  end
end
