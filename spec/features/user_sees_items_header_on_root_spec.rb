require 'rails_helper'

feature "user sees items header on root" do
  it "navigates to root" do
    visit '/'

    expect(page.status_code).to be(200)
    expect(page).to have_selector('h1')
    within('h1') { expect(page).to have_content("Items") }
  end
end