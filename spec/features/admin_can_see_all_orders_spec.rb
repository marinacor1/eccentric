require 'rails_helper'

RSpec.feature "user can see past orders" do
  include FeatureHelper
  scenario "user will see order history with all past orders" do
    user1, user2 = create_list(:user, 2)
    User.create(username: "Administrator",
                email: "e",
                password: "password",
                password_confirmation: "password",
                role: 1)

    order1 = Order.create(user_id: user1.id, total_cost: 1000 )
    order2 = Order.create(user_id: user1.id, total_cost: 2000)
    order3 = Order.create(user_id: user2.id, total_cost: 3000)

    admin_login

    visit admin_orders_path

    expect(page).to have_content order1.id
    expect(page).to have_content order1.total_cost
    expect(page).to have_content order2.id
    expect(page).to have_content order2.total_cost
    expect(page).to have_content order3.id
    expect(page).to have_content order3.total_cost
  end
end
