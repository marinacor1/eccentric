require "rails_helper"

RSpec.describe "user can land on root path" do
  scenario "user sees basic layout of page" do
    visit root_path

    expect(page).to have_content "Eccentric"

    expect(page).to have_link "Explore", href: packages_path

    within(".nav") do
      expect(page).to have_css ".fi-shopping-bag"
      expect(page).to have_link "All Packages", href: packages_path
      expect(page).to have_content "Eccentric"
    end

  end
end
