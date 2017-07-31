require 'rails_helper'

describe "best buy service" do
  it "returns expected data types and keys" do
    VCR.use_cassette('best_buy_service') do
      results = BestBuyService.fetch_stores_by_zip(80202)

      expect(results).to be_an Array
      expect(results.first).to be_a Hash
      expect(results.first).to have_key("storeType")
      expect(results.first).to have_key("city")
      expect(results.first).to have_key("distance")
      expect(results.first).to have_key("phone")
      expect(results.first).to have_key("longName")
    end
  end

  it "returns expected data types and keys" do
    VCR.use_cassette('best_buy_service_count') do
      results = BestBuyService.fetch_total_count(80202)

      expect(results).to be_an Integer
      expect(results).to eq(17)
    end
  end
end