require 'rails_helper'

RSpec.feature "User can checkout" do
  scenario "when a user checkouts they see a page with their orders" do

    package1 = create(:package)

    user = create(:user)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit package_path(package1)

    click_on "Add Package to Trip"

    visit "/trip"

    click_on "Checkout"

    expect(current_path).to eq orders_path

    order = Order.first
    expect(page).to have_content "Order was Successfully Placed"

    within '.orders' do
      expect(page).to have_content order.id
      expect(page).to have_content order.status
      expect(page).to have_content order.total_cost
      expect(page).to have_content order.total_quantity
      expect(page).to have_content order.package_names
      expect(page).to have_link "View", order_path(order)
    end
  end
  scenario "when a user a checkouts and then visits their cart it is empty" do
    package1 = create(:package)

    user = create(:user)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit package_path(package1)

    click_on "Add Package to Trip"

    visit "/trip"

    click_on "Checkout"

    visit "/trip"

    order = Order.first

    expect(page).to have_content("Your Cart is Empty")
    expect(page).to_not have_content order.id
    expect(page).to_not have_content order.status
    expect(page).to_not have_content order.total_cost
    expect(page).to_not have_content order.package_names
    expect(page).to_not have_link "View", order_path(order)
  end

  scenario "guest cannot checkout" do
    package1 = create(:package)
    visit package_path(package1)

    click_on "Add Package to Trip"

    visit "/trip"
    click_on "Login or Create Account to Purchase"

    expect(current_path).to eq(login_path)
  end
end
