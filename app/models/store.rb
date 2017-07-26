class Store
attr_reader :name, :type, :city, :distance, :phone
  def initialize(args)
    @type = args["storeType"]
    @city = args["city"]
    @distance = args["distance"]
    @phone = args["phone"]
    @name = ["longName"]
  end

  def self.fetch_stores_by_zip(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,city,distance,phone&apiKey=#{ENV['best_buy_api_key']}")
    JSON.parse(response.body)["stores"].map do |store_params|
      Store.new(store_params)
    end
  end
end