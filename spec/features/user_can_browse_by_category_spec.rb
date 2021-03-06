require 'rails_helper'

RSpec.feature "a guest can browse by destination" do
  xscenario "a guest sees an associated item for that destination " do
    destination = Destination.create(id: 1, planet: "Sun")
    package = Package.create(title: "Destination Honeymoon", price: 110, description: "Beautiful trip together.", destination_id: 1, status: "cancelled", image_file_name: "lsdjfls")

    visit root_path

    click_link package.destination.planet
    expect(current_path).to eq destination_path(package.destination.planet)


    expect(page).to have_content package.title
  end

  xscenario "a guest sees all associated items for a destination" do
    package1 = Package.create(title: "Destination Honeymoon", price: 110, description: "Beautiful trip together.", destination_id: 1, status: "cancelled", image_file_name: "lsdjfls")
    package2 = Package.create(title: "Destination moon", price: 110, description: "Beautifsdsdul trip together.", destination_id: 1, status: "cancelled", image_file_name: "lsdjfls")
    package3 = Package.create(title: "Destination Sun", price: 110, description: "Beausfsdtiful trip together.", destination_id: 1, status: "cancelled", image_file_name: "lsdjfls")
    package4 = Package.create(title: "Luxury123", price: 300,
                              description: "Fun timez",
                              destination_id: package1.destination_id)

    visit destination_path(package1.destination.planet)

      expect(page).to have_content package1.title
      expect(page).to have_content package4.title
  end

  xscenario "user will not be able to see category if category does not exist" do
    destination = Destination.new(id: 1, planet: "Mars")
    package1 = Package.new(title: "Basic", price: 100, description: "Happy place", destination_id: 1)

    visit '/neptune'
    expect(page).to have_content "The page you were looking for doesn't exist."
    end
  end
