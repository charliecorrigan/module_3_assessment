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
    store_params = BestBuyService.fetch_stores_by_zip(zip)
    store_params.map do |store_params|
      store = Store.new(store_params)
    end
  end


  def self.fetch_total_count(zip)
    BestBuyService.fetch_total_count(zip)
  end
end