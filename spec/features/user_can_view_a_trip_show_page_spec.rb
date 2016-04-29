require 'rails_helper'

RSpec.describe "user can view the show page of a location" do
  scenario "user sees detailed information about the specific location" do
    package = create(:package)
    visit packages_path
    click_on package.title

    expect(current_path).to eq(package_path(package))

    expect(page).to have_content package.title
    expect(page).to have_content package.description
    expect(page).to have_content package.price.to_s
    expect(page).to have_xpath("//img[@src=\"#{package.image}\"]")
  end
end
