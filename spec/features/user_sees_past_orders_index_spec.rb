require 'rails_helper'

RSpec.feature "user can see past orders" do
  scenario "user will see order history with all past orders" do
    user1, user2 = create_list(:user, 2)

    order1 = Order.create(user_id: user1.id, total_cost: 1000 )
    order2 = Order.create(user_id: user1.id, total_cost: 2000)
    order3 = Order.create(user_id: user2.id, total_cost: 3000)

    ApplicationController.any_instance.stubs(:current_user).returns(user1)

    visit orders_path
    expect(page).to have_content order1.id
    expect(page).to have_content order1.total_cost
    expect(page).to have_content order2.id
    expect(page).to have_content order2.total_cost
    expect(page).to_not have_content order3.id
    expect(page).to_not have_content order3.total_cost
  end
end
