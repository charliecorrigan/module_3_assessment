class BestBuyService

  def initialize(zip)
    conn = Faraday.new(:url => 'https://api.bestbuy.com/v1/') 
  end

  def self.fetch_stores_by_zip(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&pageSize=100&show=storeType,longName,city,distance,phone&apiKey=#{ENV['best_buy_api_key']}")
    JSON.parse(response.body)["stores"]
  end

  def self.fetch_total_count(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&pageSize=100&show=storeType,longName,city,distance,phone&apiKey=#{ENV['best_buy_api_key']}")
    JSON.parse(response.body)["total"]
  end
end