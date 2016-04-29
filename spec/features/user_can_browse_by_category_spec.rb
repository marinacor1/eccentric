require 'rails_helper'

RSpec.feature "a guest can browse by destination" do
  scenario "a guest sees an associated item for that destination " do

    package = create(:package)

    visit root_path

    click_link package.destination.planet
    expect(current_path).to eq destination_path(package.destination.planet)


    expect(page).to have_content package.title
  end

  scenario "a guest sees all associated items for a destination" do
    package1, package2, package3 = create_list(:package, 3)
    package4 = Package.create(title: "Luxury123", price: 300,
                              description: "Fun timez",
                              destination_id: package1.destination_id)

    visit destination_path(package1.destination.planet)

      expect(page).to have_content package1.title
      expect(page).to have_content package4.title
  end

  scenario "user will not be able to see category if category does not exist" do
    destination = Destination.new(id: 1, planet: "Mars")
    package1 = Package.new(title: "Basic", price: 100, description: "Happy place", destination_id: 1)

    visit '/neptune'
    expect(page).to have_content "The page you were looking for doesn't exist."
    end
  end
