require 'rails_helper'

RSpec.feature "User can edit their cart" do
  scenario "user can adjust individual quantities of packges" do

    package, package2 = create_list(:package, 2)

    visit package_path(package)

    click_on "Add Package to Trip"
    click_on "Add Package to Trip"

    visit package_path(package2)

    click_on "Add Package to Trip"

    visit "/trip"

    within ".cart" do
      expect(page).to have_content "2"
      expect(page).to have_content package.price * 2
    end

    within '.package' do
      first('.fi-arrow-up').click
    end

    expect(current_path).to eq "/trip"


    within ".cart" do
      expect(page).to have_content "3"
      expect(page).to have_content package.price * 3
    end

    expect(page).to have_content (package.price * 3) + package2.price

    within '.package' do
      first('.fi-arrow-down').click
      expect(current_path).to eq "/trip"
    end


    within ".cart" do
      expect(page).to have_content "2"
    end

    expect(page).to have_content (package.price * 2) + package2.price
  end
end
