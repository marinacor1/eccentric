require 'rails_helper'

RSpec.feature "user can add package to trip" do
  scenario "user can see package in trip (cart)" do
    package = create(:package)

    visit package_path(package)

    click_on "Add Package to Trip"

    expect(page).to have_content ("You have added #{package.title} to your trip. Your current trip costs: #{package.price}.")
  end

  scenario "user can see multiple packages in trip (cart)" do
    package1, package2 = create_list(:package, 2)

    visit package_path(package1)

    click_on "Add Package to Trip"

    expect(page).to have_content ("You have added #{package1.title} to your trip. Your current trip costs: #{package1.price}.")

    visit package_path(package2)

    click_on "Add Package to Trip"
    expect(page).to have_content ("You have added #{package2.title} to your trip. Your current trip costs: #{package1.price + package2.price}.")
  end
end
