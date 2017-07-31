require "rails_helper"

describe Store, type: :model do
  it "is valid" do
    store_params = {"storeType": "Mobile SAS",
                  "longName": "Cherry Creek Shopping Center",
                  "city": "Denver",
                  "distance": 3.45,
                  "phone": "303-270-9189"
                }
    store = Store.new(store_params)
    expect(store).to be_a Store
  end

  it "returns expected data from fetch_stores_by_zip" do
    VCR.use_cassette('model_store_by_zip') do
      stores = Store.fetch_stores_by_zip(80202)

      expect(stores.count).to eq(17)
      expect(stores.first).to be_a Store
      expect(stores.first).to respond_to(:type)
      expect(stores.first).to respond_to(:name)
      expect(stores.first).to respond_to(:city)
      expect(stores.first).to respond_to(:distance)
      expect(stores.first).to respond_to(:phone)
    end
  end
end
