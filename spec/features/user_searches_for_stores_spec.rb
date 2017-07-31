require 'rails_helper'

feature 'user searches for stores by zipcode' do
  it "fills in zipcode and clicks search" do
    VCR.use_cassette('store_by_zip') do
      visit '/'
      fill_in 'search', with: '80202'
      click_on 'Find Stores'
      expect(current_path).to eq("/search")

      expect(page).to have_content("17 Total Stores")
      expect(page).to have_selector(".store", count: 10)
      within first(".store") do
        expect(page).to have_selector(".store-name")
        expect(page).to have_selector(".store-city")
        expect(page).to have_selector(".store-distance")
        expect(page).to have_selector(".store-phone")
        expect(page).to have_selector(".store-type")
      end
        expect(page).to have_selector(".pagination")
        expect(page).to have_content("1")
        expect(page).to_not have_link('1')
        expect(page).to have_link('2')
    end
  end
end




