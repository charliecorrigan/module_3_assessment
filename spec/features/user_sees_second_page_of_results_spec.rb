require 'rails_helper'

feature 'user searches for stores by zipcode' do
  it "fills in zipcode and clicks search" do
    VCR.use_cassette('second_page_search') do
      visit '/'
      fill_in 'search', with: '80202'
      click_on 'Find Stores'
      expect(current_path).to eq("/search")

      click_on "2"

      expect(page).to have_content("17 Total Stores")
      expect(page).to have_selector(".store", count: 6)

      within first(".store") do
        expect(page).to have_selector(".store-name")
        expect(page).to have_selector(".store-city")
        expect(page).to have_selector(".store-distance")
        expect(page).to have_selector(".store-phone")
        expect(page).to have_selector(".store-type")
      end
    end
  end
end