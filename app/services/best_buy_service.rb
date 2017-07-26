class BestBuyService
  def self.fetch_stores_by_zip(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,city,distance,phone&apiKey=#{ENV['best_buy_api_key']}")
    JSON.parse(response.body)["stores"]
  end
end
