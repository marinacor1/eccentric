require 'rails_helper'

feature "user can view package index page" do
  scenario "user will see all packages offered" do

    package1 = Package.create(title: "Destination Honeymoon", price: 110, description: "Beautiful trip together.", destination_id: 1, status: "cancelled", image_file_name: "lsdjfls")
    package2 = Package.create(title: "Destination moon", price: 110, description: "Beautifsdsdul trip together.", destination_id: 1, status: "cancelled", image_file_name: "lsdjfls")
    package3 = Package.create(title: "Destination Sun", price: 110, description: "Beausfsdtiful trip together.", destination_id: 1, status: "cancelled", image_file_name: "lsdjfls")

    visit root_path
    click_on "Explore"

    expect(current_path).to eq(packages_path)

    expect(page).to have_link package1.title, href: package_path(package1)
    # expect(page).to have_xpath("//img[@src=\"#{package1.image}\"]")


    expect(page).to have_link package2.title, href: package_path(package2)
    # expect(page).to have_xpath("//img[@src=\"#{package2.image}\"]")

    expect(page).to have_link package3.title, href: package_path(package3)
    # expect(page).to have_xpath("//img[@src=\"#{package3.image}\"]")

  end

end
