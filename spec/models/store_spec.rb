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

end
