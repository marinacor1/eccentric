require 'rails_helper'

RSpec.feature "user sees past order details" do
  context "user has one past order" do
    scenario "they see the details of that order on a show page" do
      user = User.create(username: "Isabella",
                         email: "email1sljf",
                         password: "password",
                         password_confirmation: "password")
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      order = Order.create(user_id: user.id, total_cost: 3000)
      package1, package2 = create_list(:package, 2)
      OrderPackage.create(order_id: order.id,
                          user_id: user.id,
                          package_id: package1.id)
      OrderPackage.create(order_id: order.id,
                          user_id: user.id,
                          package_id: package2.id)

      visit orders_path

      click_on "View"

      expect(current_path).to eq order_path(order)

        expect(page).to have_content(package1.title)
        expect(page).to have_content(package1.price)
        expect(page).to have_link(package1.title, package_path(package1))
        expect(page).to have_content(package2.title)
        expect(page).to have_content(package2.price)
        expect(page).to have_link(package2.title, package_path(package2))

      within ".order-details" do
        expect(page).to have_content("Pending")
        expect(page).to have_content("3000.0")
        expect(page).to have_content(order.format_time(order.created_at))
        expect(page).to have_content(order.format_time(order.updated_at))
      end
    end
  end
end
