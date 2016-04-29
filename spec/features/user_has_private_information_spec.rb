require 'rails_helper'

RSpec.feature "user cannot see another users private data" do
  it "is private data like current or past orders" do
    user = User.create(username: "Maria",
                       email: "email1666k",
                       password: "password",
                       password_confirmation: "password")
    user2 = User.create(username: "Miguel",
                        email: "email277k",
                        password: "password",
                        password_confirmation: "password")

    order = Order.create(user_id: user2.id, total_cost: 3000)
    package1, package2 = create_list(:package, 2)
    OrderPackage.create(order_id: order.id,
                        user_id: user2.id,
                        package_id: package1.id)
    OrderPackage.create(order_id: order.id,
                        user_id: user2.id,
                        package_id: package2.id)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit order_path(order)

    expect(page).to have_content "The page you were looking for doesn't exist."
    expect(page).to_not have_content package1.title
    expect(page).to_not have_content package2.title
    expect(page).to_not have_content order.total_cost
  end

  it "guest cannot see user information" do
    user2 = User.create(username: "Miguel",
                        email: "email277k",
                        password: "password",
                        password_confirmation: "password")

    order = Order.create(user_id: user2.id, total_cost: 3000)
    package1, package2 = create_list(:package, 2)
    OrderPackage.create(order_id: order.id,
                        user_id: user2.id,
                        package_id: package1.id)
    OrderPackage.create(order_id: order.id,
                        user_id: user2.id,
                        package_id: package2.id)

    visit order_path(order)

    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end
