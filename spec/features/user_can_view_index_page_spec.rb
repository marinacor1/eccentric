require 'rails_helper'

feature "user can view index page" do
  scenario "user will see full options for images" do
    trip = create_list(:trip, 3)
    visit root_path
    click_on "Trips"

    expect(current_path).to eq(trips_path)

    within("nav_bar") do
      expect(page).to have_link "Cart", href: cart_path
      expect(page).to have_content "Logo"
    end

    expect(page).to have_content "Mars"
    expect(page).to have_content "See the red planet up close"
    expect(page).to have_content "Moon"
    expect(page).to have_content "Walk on the moon"
    expect(page).to have_content "Deep Space"
    expect(page).to have_content "See the skies like you have never seen them before"
  end

end


#Destination: Mars, Moon, Deep Space
#Trip table attributes:
#location, price, description, image_path
#Extras: Hotel, Space Walk, Dinner, Rover Rental, Stargazing
#Extras table attributes:
#Title, description, price
