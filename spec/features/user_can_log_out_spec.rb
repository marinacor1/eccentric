
require 'rails_helper'

RSpec.feature "user can log out" do
  include FeatureHelper
  scenario "they see a link to log in and not a link to log out" do

    @user = create(:user)

    user_login

    visit "/trip"

    click_on "Logout"

    expect(page).to have_content("Login")
    expect(page).to_not have_content("Logout")
  end
end
