require 'rails_helper'

describe "best buy service" do
  it "returns expected data types and keys" do
    results = BestBuyService.fetch_stores_by_zip(zip)

    expect(results.class).to be_an Array
    expect(results.first).to be_a Hash
  end
end
