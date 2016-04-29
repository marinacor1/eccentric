require "rails_helper"

RSpec.feature "user can see their packages in the trip-cart " do
  scenario "user can click the trip and see their packages" do

    package1, package2 = create_list(:package, 2)

    visit package_path(package1)

    click_on "Add Package to Trip"

    visit package_path(package2)

    click_on "Add Package to Trip"

    find(".cart-icon").click

    expect(current_path).to eq "/trip"

    total_price = package1.price + package2.price
    expect(page).to have_content(package1.title)
    expect(page).to have_content(package1.price)
    expect(page).to have_content(total_price)
  end
end
