require 'rails_helper'

describe "best buy service" do
  it "returns expected data types and keys" do
    results = BestBuyService.fetch_stores_by_zip(zip)

    expect(results.class).to be_an Array
    expect(results.first).to be_a Hash
    expect(results.first).to have_key("storeType")
    expect(results.first).to have_key("city")
    expect(results.first).to have_key("distance")
    expect(results.first).to have_key("phone")
    expect(results.first).to have_key("longName")

  end
end
